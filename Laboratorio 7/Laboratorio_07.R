library(readr)
library(lubridate)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
#install.packages("rworldmap")
library(rworldmap)


# Cargar la data
df <- read_csv(file = 'c1.csv') 
df <- df %>% select(-X23, -X24, -X25, -X26, -X27, -X28)
str(df)

# Formatear la Fecha y colocar como factor el Codigo
df$Fecha <- dmy(df$Fecha)
df$Cod <- as.factor(df$Cod)

## Eliminar las Q
Dinero <- c("Camion_5", "Pickup", "Moto", "factura", "directoCamion_5", "directoPickup", "directoMoto", "fijoCamion_5", "fijoPickup", "fijoMoto")
for (x in Dinero) {
  vec<- df %>% pull(x)
  df[,x] <-  str_replace(string = vec ,pattern = "Q-", replacement = "")
  df[,x] <-  str_replace(string = vec ,pattern = "Q", replacement = "")
  df[,x] <- as.numeric(df %>% pull(x))
}

#Hacer La data Tidy
df <- gather(df, key= "Vehiculo", value= "Gasto Total", "Camion_5", "Pickup", "Moto", na.rm = TRUE, factor_key = TRUE)
df <- gather(df, key= "V1", value= "Gasto Directo", "directoCamion_5", "directoPickup", "directoMoto", na.rm = TRUE)
df <- gather(df, key= "V2", value= "Gasto Fijo", "fijoCamion_5", "fijoPickup", "fijoMoto", na.rm = TRUE)
df <- gather(df, key = "Duracion", value ="Hi", "5-30", "30-45", "45-75", "75-120", "120+" , na.rm = TRUE, factor_key = TRUE)
df<- df %>% select(-V1, -V2, -Hi)
str(df)

#Generar Estado de Resultados
ER <- df %>% summarise(Ventas=sum(factura), `Gastos Directos`= -sum(`Gasto Directo`),
                       `Gastos Fijos`= -sum(`Gasto Fijo`), `Gastos Totales`= -sum(`Gasto Total`))
ER <- ER %>% mutate(EBITDA= Ventas- `Gastos Totales`)
ER <- gather(ER, key="Rubro", value = "Cantidad")


Unitario<- df %>% group_by(ID) %>% summarise(Precio=sum(factura), Costo= sum(`Gasto Total`)) %>% 
  ungroup() %>% summarise(`Precio`=sum(Precio)/n(), Costo= sum(Costo)/n()) 
# Se cobra Q494 por cada poste en la red aproximadamente y el costo por poste es de Q379


# Los precios promedio parecen estar bastante estables lo que indica que los clientes estan de acuerdo con las terifas
df %>% mutate(Ganancia= factura- `Gasto Total`) %>% 
  group_by( Cod, Mes=month(Fecha, label = TRUE)) %>% summarise(factura=sum(factura)/n())%>% 
  ggplot(aes(x=Mes, y=factura, color=Cod)) + geom_point(size= 3) + labs(title="Precio por Mes") + 
  theme(axis.text.x = element_text(angle = 70))
ggsave("Precio por Mes.jpg",device = "jpg", path ="graficas")

# No estamos en numeros rojos 
df %>% group_by(Mes=month(Fecha, label = TRUE)) %>% 
  summarise(Ventas=sum(factura), `Gastos Directos`= sum(`Gasto Directo`),
            `Gastos Fijos`= sum(`Gasto Fijo`), `Gastos Totales`= sum(`Gasto Total`),
            EBITDA= sum(factura)-sum(`Gasto Total`)) %>% select(Mes, EBITDA, `Gastos Fijos`, `Gastos Directos`) %>% 
  gather(key= "Rubro", value = "Cantidad", -Mes) %>%  
  ggplot(aes(x=Mes,y=Cantidad/1000, fill=Rubro)) +geom_col(position = "stack")+ labs(title="Ventas Desglosadas")
ggsave("Ventas Desglosadas.jpg",device = "jpg", path ="graficas")

# Servicios que se ofrecen
df$Cod %>% levels()


# Dias Promedio para el Mantenimiento
ID_Unicos <- unique(df$ID)
Prom_Poste <- c()
for(x in ID_Unicos){
  vec<- df %>% filter(ID== x) %>% select(Fecha) %>% arrange(Fecha) %>% pull(Fecha)
  dias_Poste <- c()
  if(length(vec)>1){
    for(j in 1:length(vec)-1){
      dias_Poste <- c(dias_Poste, vec[j+1]-vec[j]) 
    }
    Prom_Poste <- c(Prom_Poste,mean(dias_Poste))
  }
  else{
    Prom_Poste <- c(Prom_Poste,0)
  }
}
Promedio_Mantenimiento <- mean(Prom_Poste)
Promedio_Mantenimiento
# En Promedio los Postes necesitan mantenimiento cada 84 dias o 61.5 tomando en 
# cuenta a los que solo se atendieron una vez

# Las coordenadas no nos dicen nada, claramente son inventadas
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-91, -90), ylim = c(13.5, 18.5), asp = 1)
points(df$Long, df$Lat, col = df$origen, cex = .06)




# Con esta grafica podemos ver que hay dos centros muy cargados de ordenes y los otros dos no tanto,
# quiza antes de adquirir mas centros valdria la pena utilizar al maximo los existentes.
df %>% group_by(Mes= month(Fecha, label = TRUE), origen=as.factor(origen)) %>% 
  ggplot(aes(x=Mes, fill=origen)) + geom_bar(position = "dodge") + 
  labs(title="Ordenes por Centro")
ggsave("Ordenes por Centro.jpg", device = "jpg", path ="graficas" )

df %>% group_by(origen=as.factor(origen), Vehiculo) %>% 
  count() %>% arrange(origen, n) %>%  View()
  
df %>% group_by(ID) %>% count(name = "ordenes") %>% arrange(desc(ordenes)) %>% 
  ungroup() %>% select(ID,ordenes) %>% mutate(Porcentaje= ordenes/n()*100, Acumulado= cumsum(Porcentaje)) %>% arrange(desc(ordenes))%>% View()

cumsum(c(1,2,3,4,5,6))

df %>% group_by(ID) %>%count()

df %>% mutate(Ganancia= factura- `Gasto Total`) %>% group_by(Vehiculo) %>% 
  summarise(Ventas=sum(factura),Ganancia= sum(Ganancia),  Porcentaje=(sum(factura)-sum(`Gasto Total`))/sum(factura)) %>% 
  View()






