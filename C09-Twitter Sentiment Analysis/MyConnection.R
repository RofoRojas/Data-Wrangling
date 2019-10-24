library(twitteR)
library(dplyr)
library(readr)
consumer_key <- "kk443dxGyJ0Mz4CNT2wUBzqDr"
consumer_secret <- "4FNNYsggPKFZdHJnuG4HvhBPtT8TjbD5bCC46xSaXZJ26QDwYU"
access_token <- "379888016-l4MV3zflORROhLR2WqXxyir2i1eOgadyOpZ4f5Zm"
access_secret <- "uLZPF8KehU6E1nyHZJjBEt4IctJ2QY95x8jsV3ZE0yL3Q"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


tw <- twitteR::searchTwitter('Chile', n = 1e4, since = '2019-10-22', retryOnRateLimit = 1e3)

df <- twitteR::twListToDF(tw)
df %>% head() %>% View()


write_csv(df,"Chile_tweets.csv")
