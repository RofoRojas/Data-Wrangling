Laboratorio02
================
Rodolfo
7/8/2019

Laboratorio 2
-------------

    ## Loading required package: RMySQL

    ## Warning: package 'RMySQL' was built under R version 3.5.2

    ## Loading required package: DBI

``` r
# Tablas
dbListTables(mydb)
```

    ##  [1] "TablaAlex20160391"         "drinks"                   
    ##  [3] "heroes_information"        "life_expectancy"          
    ##  [5] "super_hero_powers"         "test"                     
    ##  [7] "test20150109_Boris_Juarez" "test20170036"             
    ##  [9] "test20170476"              "test20170479"             
    ## [11] "testMelany20170474"        "testVictorFarfan20170473" 
    ## [13] "testVictorFarfan201704730" "test_Rodolfo_20160315"    
    ## [15] "testkirsten20170113"       "wine"

``` r
# Fields
dbListFields(mydb, "heroes_information")
```

    ##  [1] "id"         "name"       "Gender"     "Eye color"  "Race"      
    ##  [6] "Hair color" "Height"     "Publisher"  "Skin color" "Alignment" 
    ## [11] "Weight"

Ejercicio 1

``` r
dbGetQuery(mydb, "SELECT name, Publisher FROM heroes_information;")
```

    ##                          name         Publisher
    ## 1                      A-Bomb     Marvel Comics
    ## 2                  Abe Sapien Dark Horse Comics
    ## 3                    Abin Sur         DC Comics
    ## 4                 Abomination     Marvel Comics
    ## 5                     Abraxas     Marvel Comics
    ## 6               Absorbing Man     Marvel Comics
    ## 7                 Adam Monroe      NBC - Heroes
    ## 8                Adam Strange         DC Comics
    ## 9                    Agent 13     Marvel Comics
    ## 10                  Agent Bob     Marvel Comics
    ## 11                 Agent Zero     Marvel Comics
    ## 12                 Air-Walker     Marvel Comics
    ## 13                       Ajax     Marvel Comics
    ## 14                 Alan Scott         DC Comics
    ## 15                Alex Mercer         Wildstorm
    ## 16               Alex Woolsly      NBC - Heroes
    ## 17          Alfred Pennyworth         DC Comics
    ## 18                      Alien Dark Horse Comics
    ## 19           Allan Quatermain         Wildstorm
    ## 20                      Amazo         DC Comics
    ## 21                       Ammo     Marvel Comics
    ## 22             Ando Masahashi      NBC - Heroes
    ## 23                      Angel     Marvel Comics
    ## 24                      Angel Dark Horse Comics
    ## 25                 Angel Dust     Marvel Comics
    ## 26            Angel Salvadore     Marvel Comics
    ## 27                     Angela      Image Comics
    ## 28                 Animal Man         DC Comics
    ## 29                  Annihilus     Marvel Comics
    ## 30                    Ant-Man     Marvel Comics
    ## 31                 Ant-Man II     Marvel Comics
    ## 32               Anti-Monitor         DC Comics
    ## 33                 Anti-Spawn      Image Comics
    ## 34                 Anti-Venom     Marvel Comics
    ## 35                 Apocalypse     Marvel Comics
    ## 36                   Aquababy         DC Comics
    ## 37                    Aqualad         DC Comics
    ## 38                    Aquaman         DC Comics
    ## 39                    Arachne     Marvel Comics
    ## 40                  Archangel     Marvel Comics
    ## 41                   Arclight     Marvel Comics
    ## 42                     Ardina     Marvel Comics
    ## 43                       Ares     Marvel Comics
    ## 44                      Ariel     Marvel Comics
    ## 45                      Armor     Marvel Comics
    ## 46                    Arsenal         DC Comics
    ## 47                  Astro Boy              <NA>
    ## 48                      Atlas     Marvel Comics
    ## 49                      Atlas         DC Comics
    ## 50                       Atom         DC Comics
    ## 51                       Atom         DC Comics
    ## 52                  Atom Girl         DC Comics
    ## 53                    Atom II         DC Comics
    ## 54                   Atom III         DC Comics
    ## 55                    Atom IV         DC Comics
    ## 56                     Aurora     Marvel Comics
    ## 57                     Azazel     Marvel Comics
    ## 58                     Azrael         DC Comics
    ## 59                      Aztar         DC Comics
    ## 60                       Bane         DC Comics
    ## 61                    Banshee     Marvel Comics
    ## 62                     Bantam     Marvel Comics
    ## 63                    Batgirl         DC Comics
    ## 64                    Batgirl         DC Comics
    ## 65                Batgirl III         DC Comics
    ## 66                 Batgirl IV         DC Comics
    ## 67                  Batgirl V         DC Comics
    ## 68                 Batgirl VI         DC Comics
    ## 69                     Batman         DC Comics
    ## 70                     Batman         DC Comics
    ## 71                  Batman II         DC Comics
    ## 72                 Battlestar     Marvel Comics
    ## 73                 Batwoman V         DC Comics
    ## 74                       Beak     Marvel Comics
    ## 75                      Beast     Marvel Comics
    ## 76                  Beast Boy         DC Comics
    ## 77                     Beetle     Marvel Comics
    ## 78                     Ben 10         DC Comics
    ## 79              Beta Ray Bill     Marvel Comics
    ## 80                   Beyonder     Marvel Comics
    ## 81                  Big Barda         DC Comics
    ## 82                  Big Daddy       Icon Comics
    ## 83                    Big Man     Marvel Comics
    ## 84                Bill Harken              SyFy
    ## 85              Billy Kincaid      Image Comics
    ## 86                     Binary     Marvel Comics
    ## 87               Bionic Woman              <NA>
    ## 88                 Bird-Brain     Marvel Comics
    ## 89                   Bird-Man     Marvel Comics
    ## 90                Bird-Man II     Marvel Comics
    ## 91                    Birdman     Hanna-Barbera
    ## 92                     Bishop     Marvel Comics
    ## 93                    Bizarro         DC Comics
    ## 94               Black Abbott     Marvel Comics
    ## 95                 Black Adam         DC Comics
    ## 96                 Black Bolt     Marvel Comics
    ## 97               Black Canary         DC Comics
    ## 98               Black Canary         DC Comics
    ## 99                  Black Cat     Marvel Comics
    ## 100               Black Flash         DC Comics
    ## 101             Black Goliath     Marvel Comics
    ## 102          Black Knight III     Marvel Comics
    ## 103           Black Lightning         DC Comics
    ## 104               Black Mamba     Marvel Comics
    ## 105               Black Manta         DC Comics
    ## 106             Black Panther     Marvel Comics
    ## 107               Black Widow     Marvel Comics
    ## 108            Black Widow II     Marvel Comics
    ## 109                  Blackout     Marvel Comics
    ## 110                 Blackwing     Marvel Comics
    ## 111                 Blackwulf     Marvel Comics
    ## 112                     Blade     Marvel Comics
    ## 113               Blaquesmith     Marvel Comics
    ## 114                    Bling!     Marvel Comics
    ## 115                     Blink     Marvel Comics
    ## 116                  Blizzard     Marvel Comics
    ## 117                  Blizzard     Marvel Comics
    ## 118               Blizzard II     Marvel Comics
    ## 119                      Blob     Marvel Comics
    ## 120                  Bloodaxe     Marvel Comics
    ## 121                 Bloodhawk     Marvel Comics
    ## 122               Bloodwraith     Marvel Comics
    ## 123               Blue Beetle         DC Comics
    ## 124               Blue Beetle         DC Comics
    ## 125            Blue Beetle II         DC Comics
    ## 126           Blue Beetle III         DC Comics
    ## 127                 Boba Fett      George Lucas
    ## 128                      Bolt     Marvel Comics
    ## 129                Bomb Queen      Image Comics
    ## 130                 Boom-Boom     Marvel Comics
    ## 131                    Boomer     Marvel Comics
    ## 132              Booster Gold         DC Comics
    ## 133                       Box     Marvel Comics
    ## 134                   Box III     Marvel Comics
    ## 135                    Box IV     Marvel Comics
    ## 136                  Brainiac         DC Comics
    ## 137                Brainiac 5         DC Comics
    ## 138            Brother Voodoo     Marvel Comics
    ## 139                Brundlefly              <NA>
    ## 140                     Buffy Dark Horse Comics
    ## 141                  Bullseye     Marvel Comics
    ## 142                 Bumblebee         DC Comics
    ## 143                 Bumbleboy     Marvel Comics
    ## 144                   Bushido         DC Comics
    ## 145                     Cable     Marvel Comics
    ## 146                  Callisto     Marvel Comics
    ## 147             Cameron Hicks              SyFy
    ## 148                Cannonball     Marvel Comics
    ## 149           Captain America     Marvel Comics
    ## 150              Captain Atom         DC Comics
    ## 151           Captain Britain     Marvel Comics
    ## 152              Captain Cold         DC Comics
    ## 153              Captain Epic      Team Epic TV
    ## 154         Captain Hindsight        South Park
    ## 155          Captain Mar-vell     Marvel Comics
    ## 156            Captain Marvel     Marvel Comics
    ## 157            Captain Marvel         DC Comics
    ## 158         Captain Marvel II         DC Comics
    ## 159          Captain Midnight Dark Horse Comics
    ## 160            Captain Planet     Marvel Comics
    ## 161          Captain Universe     Marvel Comics
    ## 162                   Carnage     Marvel Comics
    ## 163                       Cat     Marvel Comics
    ## 164                    Cat II     Marvel Comics
    ## 165                  Catwoman         DC Comics
    ## 166             Cecilia Reyes     Marvel Comics
    ## 167                   Century     Marvel Comics
    ## 168                   Cerebra     Marvel Comics
    ## 169                   Chamber     Marvel Comics
    ## 170                 Chameleon         DC Comics
    ## 171                Changeling     Marvel Comics
    ## 172                   Cheetah         DC Comics
    ## 173                Cheetah II         DC Comics
    ## 174               Cheetah III         DC Comics
    ## 175                   Chromos      Team Epic TV
    ## 176              Chuck Norris              <NA>
    ## 177             Citizen Steel         DC Comics
    ## 178             Claire Bennet      NBC - Heroes
    ## 179                      Clea     Marvel Comics
    ## 180                     Cloak     Marvel Comics
    ## 181                Clock King         DC Comics
    ## 182                Cogliostro      Image Comics
    ## 183              Colin Wagner     HarperCollins
    ## 184              Colossal Boy         DC Comics
    ## 185                  Colossus     Marvel Comics
    ## 186                   Copycat     Marvel Comics
    ## 187                   Corsair     Marvel Comics
    ## 188               Cottonmouth     Marvel Comics
    ## 189          Crimson Crusader     Marvel Comics
    ## 190            Crimson Dynamo     Marvel Comics
    ## 191                   Crystal     Marvel Comics
    ## 192                     Curse      Image Comics
    ## 193                    Cy-Gor      Image Comics
    ## 194                    Cyborg         DC Comics
    ## 195           Cyborg Superman         DC Comics
    ## 196                   Cyclops     Marvel Comics
    ## 197                    Cypher     Marvel Comics
    ## 198                    Dagger     Marvel Comics
    ## 199              Danny Cooper     HarperCollins
    ## 200             Daphne Powell       ABC Studios
    ## 201                 Daredevil     Marvel Comics
    ## 202                  Darkhawk     Marvel Comics
    ## 203                   Darkman Universal Studios
    ## 204                  Darkseid         DC Comics
    ## 205                  Darkside              <NA>
    ## 206                  Darkstar     Marvel Comics
    ## 207                Darth Maul      George Lucas
    ## 208               Darth Vader      George Lucas
    ## 209                      Dash Dark Horse Comics
    ## 210                      Data         Star Trek
    ## 211                   Dazzler     Marvel Comics
    ## 212                   Deadman         DC Comics
    ## 213                  Deadpool     Marvel Comics
    ## 214                  Deadshot         DC Comics
    ## 215                  Deathlok     Marvel Comics
    ## 216               Deathstroke         DC Comics
    ## 217                Demogoblin     Marvel Comics
    ## 218                 Destroyer     Marvel Comics
    ## 219               Diamondback     Marvel Comics
    ## 220                DL Hawkins      NBC - Heroes
    ## 221                Doc Samson     Marvel Comics
    ## 222               Doctor Doom     Marvel Comics
    ## 223            Doctor Doom II     Marvel Comics
    ## 224               Doctor Fate         DC Comics
    ## 225            Doctor Octopus     Marvel Comics
    ## 226            Doctor Strange     Marvel Comics
    ## 227                    Domino     Marvel Comics
    ## 228                 Donatello    IDW Publishing
    ## 229                Donna Troy         DC Comics
    ## 230                  Doomsday         DC Comics
    ## 231              Doppelganger     Marvel Comics
    ## 232                  Dormammu     Marvel Comics
    ## 233              Dr Manhattan         DC Comics
    ## 234        Drax the Destroyer     Marvel Comics
    ## 235                       Ego     Marvel Comics
    ## 236                Elastigirl Dark Horse Comics
    ## 237                   Electro     Marvel Comics
    ## 238                   Elektra     Marvel Comics
    ## 239               Elle Bishop      NBC - Heroes
    ## 240             Elongated Man         DC Comics
    ## 241                Emma Frost     Marvel Comics
    ## 242               Enchantress         DC Comics
    ## 243                    Energy     HarperCollins
    ## 244                     ERG-1         DC Comics
    ## 245                Ethan Hunt              <NA>
    ## 246                   Etrigan         DC Comics
    ## 247             Evil Deadpool     Marvel Comics
    ## 248                  Evilhawk     Marvel Comics
    ## 249                    Exodus     Marvel Comics
    ## 250             Fabian Cortez     Marvel Comics
    ## 251                    Falcon     Marvel Comics
    ## 252             Fallen One II     Marvel Comics
    ## 253                     Faora         DC Comics
    ## 254                     Feral     Marvel Comics
    ## 255           Fighting Spirit         DC Comics
    ## 256             Fin Fang Foom     Marvel Comics
    ## 257                  Firebird     Marvel Comics
    ## 258                  Firelord     Marvel Comics
    ## 259                  Firestar     Marvel Comics
    ## 260                 Firestorm         DC Comics
    ## 261                 Firestorm         DC Comics
    ## 262                     Fixer     Marvel Comics
    ## 263                     Flash         DC Comics
    ## 264              Flash Gordon              <NA>
    ## 265                  Flash II         DC Comics
    ## 266                 Flash III         DC Comics
    ## 267                  Flash IV         DC Comics
    ## 268                     Forge     Marvel Comics
    ## 269         Franklin Richards     Marvel Comics
    ## 270            Franklin Storm     Marvel Comics
    ## 271                    Frenzy     Marvel Comics
    ## 272                    Frigga     Marvel Comics
    ## 273                  Galactus     Marvel Comics
    ## 274                    Gambit     Marvel Comics
    ## 275                    Gamora     Marvel Comics
    ## 276               Garbage Man         DC Comics
    ## 277                 Gary Bell              SyFy
    ## 278               General Zod         DC Comics
    ## 279                   Genesis     Marvel Comics
    ## 280               Ghost Rider     Marvel Comics
    ## 281            Ghost Rider II     Marvel Comics
    ## 282                 Giant-Man     Marvel Comics
    ## 283              Giant-Man II     Marvel Comics
    ## 284                   Giganta         DC Comics
    ## 285                 Gladiator     Marvel Comics
    ## 286              Goblin Queen     Marvel Comics
    ## 287                  Godzilla              <NA>
    ## 288                       Gog         DC Comics
    ## 289                      Goku          Shueisha
    ## 290                   Goliath     Marvel Comics
    ## 291                   Goliath     Marvel Comics
    ## 292                   Goliath     Marvel Comics
    ## 293                Goliath IV     Marvel Comics
    ## 294             Gorilla Grodd         DC Comics
    ## 295           Granny Goodness         DC Comics
    ## 296                   Gravity     Marvel Comics
    ## 297                    Greedo      George Lucas
    ## 298               Green Arrow         DC Comics
    ## 299              Green Goblin     Marvel Comics
    ## 300           Green Goblin II     Marvel Comics
    ## 301          Green Goblin III     Marvel Comics
    ## 302           Green Goblin IV     Marvel Comics
    ## 303                     Groot     Marvel Comics
    ## 304                  Guardian     Marvel Comics
    ## 305               Guy Gardner         DC Comics
    ## 306                Hal Jordan         DC Comics
    ## 307                  Han Solo      George Lucas
    ## 308                   Hancock     Sony Pictures
    ## 309              Harley Quinn         DC Comics
    ## 310              Harry Potter     J. K. Rowling
    ## 311                     Havok     Marvel Comics
    ## 312                      Hawk         DC Comics
    ## 313                   Hawkeye     Marvel Comics
    ## 314                Hawkeye II     Marvel Comics
    ## 315                  Hawkgirl         DC Comics
    ## 316                   Hawkman         DC Comics
    ## 317                 Hawkwoman         DC Comics
    ## 318              Hawkwoman II         DC Comics
    ## 319             Hawkwoman III         DC Comics
    ## 320                 Heat Wave         DC Comics
    ## 321                      Hela     Marvel Comics
    ## 322                   Hellboy Dark Horse Comics
    ## 323                   Hellcat     Marvel Comics
    ## 324                 Hellstorm     Marvel Comics
    ## 325                  Hercules     Marvel Comics
    ## 326             Hiro Nakamura      NBC - Heroes
    ## 327                  Hit-Girl       Icon Comics
    ## 328                 Hobgoblin     Marvel Comics
    ## 329                    Hollow     Marvel Comics
    ## 330              Hope Summers     Marvel Comics
    ## 331           Howard the Duck     Marvel Comics
    ## 332                      Hulk     Marvel Comics
    ## 333               Human Torch     Marvel Comics
    ## 334                  Huntress         DC Comics
    ## 335                      Husk     Marvel Comics
    ## 336                    Hybrid     Marvel Comics
    ## 337                 Hydro-Man     Marvel Comics
    ## 338                  Hyperion     Marvel Comics
    ## 339                    Iceman     Marvel Comics
    ## 340                   Impulse         DC Comics
    ## 341             Indiana Jones      George Lucas
    ## 342                    Indigo         DC Comics
    ## 343                       Ink     Marvel Comics
    ## 344           Invisible Woman     Marvel Comics
    ## 345                 Iron Fist     Marvel Comics
    ## 346                  Iron Man     Marvel Comics
    ## 347               Iron Monger     Marvel Comics
    ## 348                      Isis         DC Comics
    ## 349                Jack Bauer              <NA>
    ## 350            Jack of Hearts     Marvel Comics
    ## 351                 Jack-Jack Dark Horse Comics
    ## 352                James Bond       Titan Books
    ## 353             James T. Kirk         Star Trek
    ## 354             Jar Jar Binks      George Lucas
    ## 355              Jason Bourne              <NA>
    ## 356                 Jean Grey     Marvel Comics
    ## 357           Jean-Luc Picard         Star Trek
    ## 358             Jennifer Kale     Marvel Comics
    ## 359               Jesse Quick         DC Comics
    ## 360              Jessica Cruz         DC Comics
    ## 361             Jessica Jones     Marvel Comics
    ## 362           Jessica Sanders      NBC - Heroes
    ## 363                    Jigsaw     Marvel Comics
    ## 364                Jim Powell       ABC Studios
    ## 365                 JJ Powell       ABC Studios
    ## 366             Johann Krauss Dark Horse Comics
    ## 367          John Constantine         DC Comics
    ## 368              John Stewart         DC Comics
    ## 369               John Wraith     Marvel Comics
    ## 370                     Joker         DC Comics
    ## 371                      Jolt     Marvel Comics
    ## 372                   Jubilee     Marvel Comics
    ## 373               Judge Dredd         Rebellion
    ## 374                Juggernaut     Marvel Comics
    ## 375                  Junkpile     Marvel Comics
    ## 376                   Justice     Marvel Comics
    ## 377                  Jyn Erso      George Lucas
    ## 378                     K-2SO      George Lucas
    ## 379                      Kang     Marvel Comics
    ## 380                Karate Kid         DC Comics
    ## 381           Kathryn Janeway         Star Trek
    ## 382          Katniss Everdeen              <NA>
    ## 383                  Kevin 11         DC Comics
    ## 384                  Kick-Ass       Icon Comics
    ## 385                 Kid Flash         DC Comics
    ## 386              Kid Flash II         DC Comics
    ## 387               Killer Croc         DC Comics
    ## 388              Killer Frost         DC Comics
    ## 389                   Kilowog         DC Comics
    ## 390                 King Kong              <NA>
    ## 391                King Shark         DC Comics
    ## 392                   Kingpin     Marvel Comics
    ## 393                      Klaw     Marvel Comics
    ## 394              Kool-Aid Man              <NA>
    ## 395                 Kraven II     Marvel Comics
    ## 396         Kraven the Hunter     Marvel Comics
    ## 397                    Krypto         DC Comics
    ## 398               Kyle Rayner         DC Comics
    ## 399                  Kylo Ren      George Lucas
    ## 400             Lady Bullseye     Marvel Comics
    ## 401          Lady Deathstrike     Marvel Comics
    ## 402                    Leader     Marvel Comics
    ## 403                     Leech     Marvel Comics
    ## 404                    Legion     Marvel Comics
    ## 405                  Leonardo    IDW Publishing
    ## 406                Lex Luthor         DC Comics
    ## 407                Light Lass         DC Comics
    ## 408             Lightning Lad         DC Comics
    ## 409            Lightning Lord         DC Comics
    ## 410              Living Brain     Marvel Comics
    ## 411           Living Tribunal     Marvel Comics
    ## 412               Liz Sherman Dark Horse Comics
    ## 413                    Lizard     Marvel Comics
    ## 414                      Lobo         DC Comics
    ## 415                      Loki     Marvel Comics
    ## 416                  Longshot     Marvel Comics
    ## 417                 Luke Cage     Marvel Comics
    ## 418             Luke Campbell      NBC - Heroes
    ## 419            Luke Skywalker      George Lucas
    ## 420                      Luna     Marvel Comics
    ## 421                      Lyja     Marvel Comics
    ## 422                   Mach-IV     Marvel Comics
    ## 423               Machine Man     Marvel Comics
    ## 424                   Magneto     Marvel Comics
    ## 425                     Magog         DC Comics
    ## 426                     Magus     Marvel Comics
    ## 427           Man of Miracles      Image Comics
    ## 428                   Man-Bat         DC Comics
    ## 429                 Man-Thing     Marvel Comics
    ## 430                  Man-Wolf     Marvel Comics
    ## 431                  Mandarin     Marvel Comics
    ## 432                    Mantis     Marvel Comics
    ## 433         Martian Manhunter         DC Comics
    ## 434               Marvel Girl     Marvel Comics
    ## 435              Master Brood      Team Epic TV
    ## 436              Master Chief         Microsoft
    ## 437                     Match         DC Comics
    ## 438              Matt Parkman      NBC - Heroes
    ## 439                  Maverick     Marvel Comics
    ## 440                    Maxima         DC Comics
    ## 441              Maya Herrera      NBC - Heroes
    ## 442                    Medusa     Marvel Comics
    ## 443                  Meltdown     Marvel Comics
    ## 444                  Mephisto     Marvel Comics
    ## 445                      Mera         DC Comics
    ## 446                   Metallo         DC Comics
    ## 447                Metamorpho         DC Comics
    ## 448                 Meteorite     Marvel Comics
    ## 449                    Metron         DC Comics
    ## 450             Micah Sanders      NBC - Heroes
    ## 451              Michelangelo    IDW Publishing
    ## 452                 Micro Lad         DC Comics
    ## 453                     Mimic     Marvel Comics
    ## 454              Minna Murray         Wildstorm
    ## 455                    Misfit         DC Comics
    ## 456              Miss Martian         DC Comics
    ## 457          Mister Fantastic     Marvel Comics
    ## 458             Mister Freeze         DC Comics
    ## 459              Mister Knife     Marvel Comics
    ## 460           Mister Mxyzptlk         DC Comics
    ## 461           Mister Sinister     Marvel Comics
    ## 462              Mister Zsasz         DC Comics
    ## 463               Mockingbird     Marvel Comics
    ## 464                     MODOK     Marvel Comics
    ## 465                      Mogo         DC Comics
    ## 466           Mohinder Suresh      NBC - Heroes
    ## 467                    Moloch         DC Comics
    ## 468                Molten Man     Marvel Comics
    ## 469                   Monarch         DC Comics
    ## 470             Monica Dawson      NBC - Heroes
    ## 471               Moon Knight     Marvel Comics
    ## 472                 Moonstone     Marvel Comics
    ## 473                    Morlun     Marvel Comics
    ## 474                     Morph     Marvel Comics
    ## 475              Moses Magnum     Marvel Comics
    ## 476               Mr Immortal     Marvel Comics
    ## 477             Mr Incredible Dark Horse Comics
    ## 478              Ms Marvel II     Marvel Comics
    ## 479              Multiple Man     Marvel Comics
    ## 480                  Mysterio     Marvel Comics
    ## 481                  Mystique     Marvel Comics
    ## 482                     Namor     Marvel Comics
    ## 483                     Namor     Marvel Comics
    ## 484                    Namora     Marvel Comics
    ## 485                  Namorita     Marvel Comics
    ## 486            Naruto Uzumaki          Shueisha
    ## 487           Nathan Petrelli      NBC - Heroes
    ## 488                    Nebula     Marvel Comics
    ## 489 Negasonic Teenage Warhead     Marvel Comics
    ## 490                 Nick Fury     Marvel Comics
    ## 491              Nightcrawler     Marvel Comics
    ## 492                 Nightwing         DC Comics
    ## 493              Niki Sanders      NBC - Heroes
    ## 494              Nina Theroux              SyFy
    ## 495               Nite Owl II         DC Comics
    ## 496                 Northstar     Marvel Comics
    ## 497                      Nova     Marvel Comics
    ## 498                      Nova     Marvel Comics
    ## 499                      Odin     Marvel Comics
    ## 500                 Offspring         DC Comics
    ## 501                 Omega Red     Marvel Comics
    ## 502                Omniscient      Team Epic TV
    ## 503             One Punch Man          Shueisha
    ## 504             One-Above-All     Marvel Comics
    ## 505                 Onslaught     Marvel Comics
    ## 506                    Oracle         DC Comics
    ## 507                    Osiris         DC Comics
    ## 508                 Overtkill      Image Comics
    ## 509                Ozymandias         DC Comics
    ## 510                 Parademon         DC Comics
    ## 511                Paul Blart     Sony Pictures
    ## 512                   Penance     Marvel Comics
    ## 513                 Penance I     Marvel Comics
    ## 514                Penance II     Marvel Comics
    ## 515                   Penguin         DC Comics
    ## 516            Peter Petrelli      NBC - Heroes
    ## 517                   Phantom         DC Comics
    ## 518              Phantom Girl         DC Comics
    ## 519                   Phoenix     Marvel Comics
    ## 520                  Plantman     Marvel Comics
    ## 521               Plastic Lad         DC Comics
    ## 522               Plastic Man         DC Comics
    ## 523                 Plastique         DC Comics
    ## 524                Poison Ivy         DC Comics
    ## 525                   Polaris     Marvel Comics
    ## 526                Power Girl         DC Comics
    ## 527                 Power Man     Marvel Comics
    ## 528                  Predator Dark Horse Comics
    ## 529               Professor X     Marvel Comics
    ## 530            Professor Zoom         DC Comics
    ## 531              Proto-Goblin     Marvel Comics
    ## 532                  Psylocke     Marvel Comics
    ## 533                  Punisher     Marvel Comics
    ## 534                Purple Man     Marvel Comics
    ## 535                      Pyro     Marvel Comics
    ## 536                         Q         Star Trek
    ## 537                   Quantum     HarperCollins
    ## 538                  Question         DC Comics
    ## 539               Quicksilver     Marvel Comics
    ## 540                     Quill     Marvel Comics
    ## 541              Ra's Al Ghul         DC Comics
    ## 542             Rachel Pirzad              SyFy
    ## 543                     Rambo              <NA>
    ## 544                   Raphael    IDW Publishing
    ## 545                     Raven         DC Comics
    ## 546                       Ray         DC Comics
    ## 547             Razor-Fist II     Marvel Comics
    ## 548                 Red Arrow         DC Comics
    ## 549                  Red Hood         DC Comics
    ## 550                  Red Hulk     Marvel Comics
    ## 551                  Red Mist       Icon Comics
    ## 552                 Red Robin         DC Comics
    ## 553                 Red Skull     Marvel Comics
    ## 554               Red Tornado         DC Comics
    ## 555               Redeemer II      Image Comics
    ## 556              Redeemer III      Image Comics
    ## 557              Renata Soliz     HarperCollins
    ## 558                       Rey      George Lucas
    ## 559                     Rhino     Marvel Comics
    ## 560                 Rick Flag         DC Comics
    ## 561                   Riddler         DC Comics
    ## 562                Rip Hunter         DC Comics
    ## 563                   Ripcord     Marvel Comics
    ## 564                     Robin         DC Comics
    ## 565                  Robin II         DC Comics
    ## 566                 Robin III         DC Comics
    ## 567                   Robin V         DC Comics
    ## 568                  Robin VI         DC Comics
    ## 569            Rocket Raccoon     Marvel Comics
    ## 570                     Rogue     Marvel Comics
    ## 571                     Ronin     Marvel Comics
    ## 572                 Rorschach         DC Comics
    ## 573                Sabretooth     Marvel Comics
    ## 574                      Sage     Marvel Comics
    ## 575                   Sandman     Marvel Comics
    ## 576                 Sasquatch     Marvel Comics
    ## 577                    Sauron  J. R. R. Tolkien
    ## 578             Savage Dragon      Image Comics
    ## 579                 Scarecrow         DC Comics
    ## 580            Scarlet Spider     Marvel Comics
    ## 581         Scarlet Spider II     Marvel Comics
    ## 582             Scarlet Witch     Marvel Comics
    ## 583                   Scorpia     Marvel Comics
    ## 584                  Scorpion     Marvel Comics
    ## 585            Sebastian Shaw     Marvel Comics
    ## 586                    Sentry     Marvel Comics
    ## 587               Shadow King     Marvel Comics
    ## 588               Shadow Lass         DC Comics
    ## 589                 Shadowcat     Marvel Comics
    ## 590                 Shang-Chi     Marvel Comics
    ## 591               Shatterstar     Marvel Comics
    ## 592                  She-Hulk     Marvel Comics
    ## 593                 She-Thing     Marvel Comics
    ## 594                   Shocker     Marvel Comics
    ## 595                    Shriek     Marvel Comics
    ## 596          Shrinking Violet         DC Comics
    ## 597                       Sif     Marvel Comics
    ## 598                      Silk     Marvel Comics
    ## 599              Silk Spectre         DC Comics
    ## 600           Silk Spectre II         DC Comics
    ## 601             Silver Surfer     Marvel Comics
    ## 602                Silverclaw     Marvel Comics
    ## 603                 Simon Baz         DC Comics
    ## 604                  Sinestro         DC Comics
    ## 605                     Siren         DC Comics
    ## 606                  Siren II         DC Comics
    ## 607                     Siryn     Marvel Comics
    ## 608                     Skaar     Marvel Comics
    ## 609                Snake-Eyes     Marvel Comics
    ## 610                  Snowbird     Marvel Comics
    ## 611                     Sobek         DC Comics
    ## 612            Solomon Grundy         DC Comics
    ## 613                  Songbird     Marvel Comics
    ## 614               Space Ghost         DC Comics
    ## 615                     Spawn      Image Comics
    ## 616                   Spectre         DC Comics
    ## 617                 Speedball     Marvel Comics
    ## 618                    Speedy         DC Comics
    ## 619                    Speedy         DC Comics
    ## 620            Spider-Carnage     Marvel Comics
    ## 621               Spider-Girl     Marvel Comics
    ## 622               Spider-Gwen     Marvel Comics
    ## 623                Spider-Man     Marvel Comics
    ## 624                Spider-Man     Marvel Comics
    ## 625                Spider-Man     Marvel Comics
    ## 626              Spider-Woman     Marvel Comics
    ## 627           Spider-Woman II     Marvel Comics
    ## 628          Spider-Woman III     Marvel Comics
    ## 629           Spider-Woman IV     Marvel Comics
    ## 630                     Spock         Star Trek
    ## 631                     Spyke     Marvel Comics
    ## 632                   Stacy X     Marvel Comics
    ## 633                 Star-Lord     Marvel Comics
    ## 634                  Stardust     Marvel Comics
    ## 635                  Starfire         DC Comics
    ## 636                  Stargirl         DC Comics
    ## 637                    Static         DC Comics
    ## 638                     Steel         DC Comics
    ## 639          Stephanie Powell       ABC Studios
    ## 640               Steppenwolf         DC Comics
    ## 641                     Storm     Marvel Comics
    ## 642              Stormtrooper      George Lucas
    ## 643                   Sunspot     Marvel Comics
    ## 644                  Superboy         DC Comics
    ## 645            Superboy-Prime         DC Comics
    ## 646                 Supergirl         DC Comics
    ## 647                  Superman         DC Comics
    ## 648               Swamp Thing         DC Comics
    ## 649                     Swarm     Marvel Comics
    ## 650                     Sylar      NBC - Heroes
    ## 651                     Synch     Marvel Comics
    ## 652                    T-1000 Dark Horse Comics
    ## 653                     T-800 Dark Horse Comics
    ## 654                     T-850 Dark Horse Comics
    ## 655                       T-X Dark Horse Comics
    ## 656                Taskmaster     Marvel Comics
    ## 657                   Tempest     Marvel Comics
    ## 658                    Thanos     Marvel Comics
    ## 659                  The Cape              <NA>
    ## 660              The Comedian         DC Comics
    ## 661                     Thing     Marvel Comics
    ## 662                      Thor     Marvel Comics
    ## 663                 Thor Girl     Marvel Comics
    ## 664               Thunderbird     Marvel Comics
    ## 665            Thunderbird II     Marvel Comics
    ## 666           Thunderbird III     Marvel Comics
    ## 667             Thunderstrike     Marvel Comics
    ## 668                   Thundra     Marvel Comics
    ## 669               Tiger Shark     Marvel Comics
    ## 670                     Tigra     Marvel Comics
    ## 671                  Tinkerer     Marvel Comics
    ## 672                     Titan     HarperCollins
    ## 673                      Toad     Marvel Comics
    ## 674                     Toxin     Marvel Comics
    ## 675                     Toxin     Marvel Comics
    ## 676             Tracy Strauss      NBC - Heroes
    ## 677                 Trickster         DC Comics
    ## 678                    Trigon         DC Comics
    ## 679           Triplicate Girl         DC Comics
    ## 680                    Triton     Marvel Comics
    ## 681                  Two-Face         DC Comics
    ## 682                 Ultragirl     Marvel Comics
    ## 683                    Ultron     Marvel Comics
    ## 684               Utgard-Loki     Marvel Comics
    ## 685                  Vagabond     Marvel Comics
    ## 686              Valerie Hart      Team Epic TV
    ## 687                  Valkyrie     Marvel Comics
    ## 688                  Vanisher     Marvel Comics
    ## 689                    Vegeta          Shueisha
    ## 690                     Venom     Marvel Comics
    ## 691                  Venom II     Marvel Comics
    ## 692                 Venom III     Marvel Comics
    ## 693                 Venompool     Marvel Comics
    ## 694                Vertigo II     Marvel Comics
    ## 695                      Vibe         DC Comics
    ## 696                Vindicator     Marvel Comics
    ## 697                Vindicator     Marvel Comics
    ## 698                  Violator      Image Comics
    ## 699               Violet Parr Dark Horse Comics
    ## 700                    Vision     Marvel Comics
    ## 701                 Vision II     Marvel Comics
    ## 702                     Vixen         DC Comics
    ## 703                    Vulcan     Marvel Comics
    ## 704                   Vulture     Marvel Comics
    ## 705                    Walrus     Marvel Comics
    ## 706               War Machine     Marvel Comics
    ## 707                   Warbird     Marvel Comics
    ## 708                   Warlock     Marvel Comics
    ## 709                      Warp         DC Comics
    ## 710                   Warpath     Marvel Comics
    ## 711                      Wasp     Marvel Comics
    ## 712                   Watcher     Marvel Comics
    ## 713                 Weapon XI     Marvel Comics
    ## 714              White Canary         DC Comics
    ## 715               White Queen     Marvel Comics
    ## 716                  Wildfire         DC Comics
    ## 717            Winter Soldier     Marvel Comics
    ## 718                   Wiz Kid     Marvel Comics
    ## 719                 Wolfsbane     Marvel Comics
    ## 720                 Wolverine     Marvel Comics
    ## 721               Wonder Girl         DC Comics
    ## 722                Wonder Man     Marvel Comics
    ## 723              Wonder Woman         DC Comics
    ## 724                    Wondra     Marvel Comics
    ## 725            Wyatt Wingfoot     Marvel Comics
    ## 726                      X-23     Marvel Comics
    ## 727                     X-Man     Marvel Comics
    ## 728               Yellow Claw     Marvel Comics
    ## 729              Yellowjacket     Marvel Comics
    ## 730           Yellowjacket II     Marvel Comics
    ## 731                      Ymir     Marvel Comics
    ## 732                      Yoda      George Lucas
    ## 733                   Zatanna         DC Comics
    ## 734                      Zoom         DC Comics

Ejercicio 2

``` r
dbGetQuery(mydb, "SELECT DISTINCT Publisher FROM heroes_information;")
```

    ##            Publisher
    ## 1      Marvel Comics
    ## 2  Dark Horse Comics
    ## 3          DC Comics
    ## 4       NBC - Heroes
    ## 5          Wildstorm
    ## 6       Image Comics
    ## 7               <NA>
    ## 8        Icon Comics
    ## 9               SyFy
    ## 10     Hanna-Barbera
    ## 11      George Lucas
    ## 12      Team Epic TV
    ## 13        South Park
    ## 14     HarperCollins
    ## 15       ABC Studios
    ## 16 Universal Studios
    ## 17         Star Trek
    ## 18    IDW Publishing
    ## 19          Shueisha
    ## 20     Sony Pictures
    ## 21     J. K. Rowling
    ## 22       Titan Books
    ## 23         Rebellion
    ## 24         Microsoft
    ## 25  J. R. R. Tolkien

Ejercicio 3 COUNT

``` r
dbGetQuery(mydb, "SELECT COUNT(DISTINCT Publisher) FROM heroes_information;")
```

    ##   COUNT(DISTINCT Publisher)
    ## 1                        24

Ejercicio 4 WHERE &lt;&gt; Not 5

``` r
dbGetQuery(mydb, paste("SELECT  * ", 
                       "FROM heroes_information ",
                       "WHERE Height > 200;", sep = ""))
```

    ##     id              name Gender Eye color              Race Hair color
    ## 1    0            A-Bomb   Male    yellow             Human    No Hair
    ## 2    3       Abomination   Male     green Human / Radiation    No Hair
    ## 3   17             Alien   Male      NULL   Xenomorph XX121    No Hair
    ## 4   19             Amazo   Male       red           Android       NULL
    ## 5   29           Ant-Man   Male      blue             Human      Blond
    ## 6   33        Anti-Venom   Male      blue          Symbiote      Blond
    ## 7   34        Apocalypse   Male       red            Mutant      Black
    ## 8   59              Bane   Male      NULL             Human       NULL
    ## 9   78     Beta Ray Bill   Male      NULL              NULL    No Hair
    ## 10 119          Bloodaxe Female      blue             Human      Brown
    ## 11 144             Cable   Male      blue            Mutant      White
    ## 12 166           Century   Male     white             Alien      White
    ## 13 179             Cloak   Male     brown              NULL      black
    ## 14 184          Colossus   Male    silver            Mutant      Black
    ## 15 203          Darkseid   Male       red           New God    No Hair
    ## 16 221       Doctor Doom   Male     brown             Human      Brown
    ## 17 222    Doctor Doom II   Male     brown              NULL      Brown
    ## 18 229          Doomsday   Male       red             Alien      White
    ## 19 255     Fin Fang Foom   Male       red   Kakarantharaian    No Hair
    ## 20 270            Frenzy Female     brown              NULL      Black
    ## 21 272          Galactus   Male     black     Cosmic Entity      Black
    ## 22 302             Groot   Male    yellow    Flora Colossus       NULL
    ## 23 320              Hela Female     green         Asgardian      Black
    ## 24 321           Hellboy   Male      gold             Demon      Black
    ## 25 331              Hulk   Male     green Human / Radiation      Green
    ## 26 373        Juggernaut   Male      blue             Human        Red
    ## 27 377             K-2SO   Male     white           Android    No Hair
    ## 28 386       Killer Croc   Male       red         Metahuman    No Hair
    ## 29 388           Kilowog   Male       red        Bolovaxian    No Hair
    ## 30 391           Kingpin   Male      blue             Human    No Hair
    ## 31 412            Lizard   Male       red             Human    No Hair
    ## 32 413              Lobo   Male       red          Czarnian      Black
    ## 33 428         Man-Thing   Male       red              NULL    No Hair
    ## 34 432 Martian Manhunter   Male       red           Martian    No Hair
    ## 35 435      Master Chief   Male     brown   Human / Altered      Brown
    ## 36 463             MODOK   Male     white            Cyborg     Brownn
    ## 37 476     Mr Incredible   Male      blue             Human      Blond
    ## 38 498              Odin   Male      blue     God / Eternal      White
    ## 39 500         Omega Red   Male       red              NULL      Blond
    ## 40 504         Onslaught   Male       red            Mutant    No Hair
    ## 41 527          Predator   Male      NULL            Yautja       NULL
    ## 42 549          Red Hulk   Male    yellow Human / Radiation      Black
    ## 43 557               Rey Female     hazel             Human      Brown
    ## 44 575         Sasquatch   Male       red              NULL     Orange
    ## 45 576            Sauron   Male      NULL             Maiar       NULL
    ## 46 583          Scorpion   Male     brown             Human      Brown
    ## 47 591          She-Hulk Female     green             Human      Green
    ## 48 603          Sinestro   Male     black         Korugaran      Black
    ## 49 611    Solomon Grundy   Male     black            Zombie      White
    ## 50 614             Spawn   Male     brown             Demon      Black
    ## 51 637             Steel   Male     brown              NULL    No Hair
    ## 52 657            Thanos   Male       red           Eternal    No Hair
    ## 53 667           Thundra Female     green              NULL        Red
    ## 54 682            Ultron   Male       red           Android       NULL
    ## 55 691         Venom III   Male     brown          Symbiote      Brown
    ## 56 692         Venompool   Male      NULL          Symbiote       NULL
    ## 57 709           Warpath   Male     brown            Mutant      Black
    ## 58 718         Wolfsbane Female     green              NULL     Auburn
    ## 59 730              Ymir   Male     white       Frost Giant    No Hair
    ##    Height         Publisher Skin color Alignment Weight
    ## 1   203.0     Marvel Comics       NULL      good    441
    ## 2   203.0     Marvel Comics       NULL       bad    441
    ## 3   244.0 Dark Horse Comics      black       bad    169
    ## 4   257.0         DC Comics       NULL       bad    173
    ## 5   211.0     Marvel Comics       NULL      good    122
    ## 6   229.0     Marvel Comics       NULL      NULL    358
    ## 7   213.0     Marvel Comics       grey       bad    135
    ## 8   203.0         DC Comics       NULL       bad    180
    ## 9   201.0     Marvel Comics       NULL      good    216
    ## 10  218.0     Marvel Comics       NULL       bad    495
    ## 11  203.0     Marvel Comics       NULL      good    158
    ## 12  201.0     Marvel Comics       grey      good     97
    ## 13  226.0     Marvel Comics       NULL      good     70
    ## 14  226.0     Marvel Comics       NULL      good    225
    ## 15  267.0         DC Comics       grey       bad    817
    ## 16  201.0     Marvel Comics       NULL       bad    187
    ## 17  201.0     Marvel Comics       NULL       bad    132
    ## 18  244.0         DC Comics       NULL       bad    412
    ## 19  975.0     Marvel Comics      green      good     18
    ## 20  211.0     Marvel Comics       NULL       bad    104
    ## 21  876.0     Marvel Comics       NULL   neutral     16
    ## 22  701.0     Marvel Comics       NULL      good      4
    ## 23  213.0     Marvel Comics       NULL       bad    225
    ## 24  259.0 Dark Horse Comics       NULL      good    158
    ## 25  244.0     Marvel Comics      green      good    630
    ## 26  287.0     Marvel Comics       NULL   neutral    855
    ## 27  213.0      George Lucas       gray      good    -99
    ## 28  244.0         DC Comics      green       bad    356
    ## 29  234.0         DC Comics       pink      good    324
    ## 30  201.0     Marvel Comics       NULL       bad    203
    ## 31  203.0     Marvel Comics       NULL       bad    230
    ## 32  229.0         DC Comics blue-white   neutral    288
    ## 33  213.0     Marvel Comics      green      good    225
    ## 34  201.0         DC Comics      green      good    135
    ## 35  213.0         Microsoft       NULL      good    -99
    ## 36  366.0     Marvel Comics       NULL       bad    338
    ## 37  201.0 Dark Horse Comics       NULL      good    158
    ## 38  206.0     Marvel Comics       NULL      good    293
    ## 39  211.0     Marvel Comics       NULL       bad    191
    ## 40  305.0     Marvel Comics       NULL       bad    405
    ## 41  213.0 Dark Horse Comics       NULL       bad    234
    ## 42  213.0     Marvel Comics        red   neutral    630
    ## 43  297.0      George Lucas       NULL      good    -99
    ## 44  305.0     Marvel Comics       NULL      good    900
    ## 45  279.0  J. R. R. Tolkien       NULL       bad    -99
    ## 46  211.0     Marvel Comics       NULL       bad    310
    ## 47  201.0     Marvel Comics       NULL      good    315
    ## 48  201.0         DC Comics        red   neutral     92
    ## 49  279.0         DC Comics       NULL       bad    437
    ## 50  211.0      Image Comics       NULL      good    405
    ## 51  201.0         DC Comics       NULL      good    131
    ## 52  201.0     Marvel Comics     purple       bad    443
    ## 53  218.0     Marvel Comics       NULL      good    158
    ## 54  206.0     Marvel Comics     silver       bad    331
    ## 55  229.0     Marvel Comics       NULL       bad    334
    ## 56  226.0     Marvel Comics       NULL      NULL    -99
    ## 57  218.0     Marvel Comics       NULL      good    158
    ## 58  366.0     Marvel Comics       NULL      good    473
    ## 59  304.8     Marvel Comics      white      good    -99

Ejercicio 6 AND

``` r
dbGetQuery(mydb, paste("SELECT  * ", 
                       "FROM heroes_information ",
                       "WHERE Height > 200 ", 
                       "AND Race = 'Human';",
                       sep = ""))
```

    ##     id          name Gender Eye color  Race Hair color Height
    ## 1    0        A-Bomb   Male    yellow Human    No Hair    203
    ## 2   29       Ant-Man   Male      blue Human      Blond    211
    ## 3   59          Bane   Male      NULL Human       NULL    203
    ## 4  119      Bloodaxe Female      blue Human      Brown    218
    ## 5  221   Doctor Doom   Male     brown Human      Brown    201
    ## 6  373    Juggernaut   Male      blue Human        Red    287
    ## 7  391       Kingpin   Male      blue Human    No Hair    201
    ## 8  412        Lizard   Male       red Human    No Hair    203
    ## 9  476 Mr Incredible   Male      blue Human      Blond    201
    ## 10 557           Rey Female     hazel Human      Brown    297
    ## 11 583      Scorpion   Male     brown Human      Brown    211
    ## 12 591      She-Hulk Female     green Human      Green    201
    ##            Publisher Skin color Alignment Weight
    ## 1      Marvel Comics       NULL      good    441
    ## 2      Marvel Comics       NULL      good    122
    ## 3          DC Comics       NULL       bad    180
    ## 4      Marvel Comics       NULL       bad    495
    ## 5      Marvel Comics       NULL       bad    187
    ## 6      Marvel Comics       NULL   neutral    855
    ## 7      Marvel Comics       NULL       bad    203
    ## 8      Marvel Comics       NULL       bad    230
    ## 9  Dark Horse Comics       NULL      good    158
    ## 10      George Lucas       NULL      good    -99
    ## 11     Marvel Comics       NULL       bad    310
    ## 12     Marvel Comics       NULL      good    315

Ejercicio 7

``` r
dbGetQuery(mydb, paste("SELECT  COUNT(*) ", 
                       "FROM heroes_information ",
                       "WHERE Weight > 100 ", 
                       "AND Race < 200;",
                       sep = ""))
```

    ##   COUNT(*)
    ## 1      149

Ejercicio 8 OR

``` r
dbGetQuery(mydb, paste("SELECT  COUNT(*) ", 
                       "FROM heroes_information ",
                       "WHERE `Eye color` = 'blue' ", 
                       "OR `Eye color` = 'red';",
                       sep = ""))
```

    ##   COUNT(*)
    ## 1      271

Ejercicio 9 BETWEEN

``` r
dbGetQuery(mydb, paste("SELECT COUNT(*) ", 
                       "FROM heroes_information ",
                       "WHERE Weight BETWEEN 100 AND 200;", 
                       sep = ""))
```

    ##   COUNT(*)
    ## 1       98

Ejercicio 10 ORDER BY - DESC

``` r
dbGetQuery(mydb, paste("SELECT name, Weight, Height  ", 
                       "FROM heroes_information ",
                       "WHERE Weight >200 AND Height > 100 ",
                       "ORDER BY Height DESC;",
                       sep = ""))
```

    ##                  name Weight Height
    ## 1               MODOK    338    366
    ## 2           Wolfsbane    473    366
    ## 3           Onslaught    405    305
    ## 4           Sasquatch    900    305
    ## 5          Juggernaut    855    287
    ## 6      Solomon Grundy    437    279
    ## 7            Darkseid    817    267
    ## 8            Doomsday    412    244
    ## 9                Hulk    630    244
    ## 10        Killer Croc    356    244
    ## 11            Kilowog    324    234
    ## 12         Anti-Venom    358    229
    ## 13               Lobo    288    229
    ## 14          Venom III    334    229
    ## 15           Colossus    225    226
    ## 16           Bloodaxe    495    218
    ## 17               Hela    225    213
    ## 18          Man-Thing    225    213
    ## 19           Predator    234    213
    ## 20           Red Hulk    630    213
    ## 21           Scorpion    310    211
    ## 22              Spawn    405    211
    ## 23               Odin    293    206
    ## 24             Ultron    331    206
    ## 25             A-Bomb    441    203
    ## 26        Abomination    441    203
    ## 27             Lizard    230    203
    ## 28      Beta Ray Bill    216    201
    ## 29            Kingpin    203    201
    ## 30           She-Hulk    315    201
    ## 31             Thanos    443    201
    ## 32          Gladiator    268    198
    ## 33      Gorilla Grodd    270    198
    ## 34       Living Brain    360    198
    ## 35               Thor    288    198
    ## 36      Thunderstrike    288    198
    ## 37         Molten Man    248    196
    ## 38              Rhino    320    196
    ## 39 Drax the Destroyer    306    193
    ## 40            Etrigan    203    193
    ## 41               Loki    236    193
    ## 42           Valkyrie    214    191
    ## 43          Destroyer    383    188
    ## 44               Ares    270    185
    ## 45            Sandman    203    185
    ## 46        Tiger Shark    203    185
    ## 47           Hyperion    207    183
    ## 48        Machine Man    383    183
    ## 49              Thing    225    183
    ## 50               Blob    230    178

Ejercicio 11 ORDER BY - DESC

``` r
dbGetQuery(mydb, paste("SELECT name, Race  ",
                       "FROM heroes_information ",
                       "ORDER BY name, Race;",
                       sep = ""))
```

    ##                          name               Race
    ## 1                      A-Bomb              Human
    ## 2                  Abe Sapien      Icthyo Sapien
    ## 3                    Abin Sur            Ungaran
    ## 4                 Abomination  Human / Radiation
    ## 5                     Abraxas      Cosmic Entity
    ## 6               Absorbing Man              Human
    ## 7                 Adam Monroe               NULL
    ## 8                Adam Strange              Human
    ## 9                    Agent 13               NULL
    ## 10                  Agent Bob              Human
    ## 11                 Agent Zero               NULL
    ## 12                 Air-Walker               NULL
    ## 13                       Ajax             Cyborg
    ## 14                 Alan Scott               NULL
    ## 15                Alex Mercer              Human
    ## 16               Alex Woolsly               NULL
    ## 17          Alfred Pennyworth              Human
    ## 18                      Alien    Xenomorph XX121
    ## 19           Allan Quatermain               NULL
    ## 20                      Amazo            Android
    ## 21                       Ammo              Human
    ## 22             Ando Masahashi               NULL
    ## 23                      Angel               NULL
    ## 24                      Angel            Vampire
    ## 25                 Angel Dust             Mutant
    ## 26            Angel Salvadore               NULL
    ## 27                     Angela               NULL
    ## 28                 Animal Man              Human
    ## 29                  Annihilus               NULL
    ## 30                    Ant-Man              Human
    ## 31                 Ant-Man II              Human
    ## 32               Anti-Monitor      God / Eternal
    ## 33                 Anti-Spawn               NULL
    ## 34                 Anti-Venom           Symbiote
    ## 35                 Apocalypse             Mutant
    ## 36                   Aquababy               NULL
    ## 37                    Aqualad          Atlantean
    ## 38                    Aquaman          Atlantean
    ## 39                    Arachne              Human
    ## 40                  Archangel             Mutant
    ## 41                   Arclight               NULL
    ## 42                     Ardina              Alien
    ## 43                       Ares               NULL
    ## 44                      Ariel               NULL
    ## 45                      Armor               NULL
    ## 46                    Arsenal              Human
    ## 47                  Astro Boy               NULL
    ## 48                      Atlas      God / Eternal
    ## 49                      Atlas             Mutant
    ## 50                       Atom               NULL
    ## 51                       Atom               NULL
    ## 52                  Atom Girl               NULL
    ## 53                    Atom II              Human
    ## 54                   Atom III               NULL
    ## 55                    Atom IV               NULL
    ## 56                     Aurora             Mutant
    ## 57                     Azazel           Neyaphem
    ## 58                     Azrael              Human
    ## 59                      Aztar               NULL
    ## 60                       Bane              Human
    ## 61                    Banshee              Human
    ## 62                     Bantam               NULL
    ## 63                    Batgirl              Human
    ## 64                    Batgirl               NULL
    ## 65                Batgirl III               NULL
    ## 66                 Batgirl IV              Human
    ## 67                  Batgirl V               NULL
    ## 68                 Batgirl VI               NULL
    ## 69                     Batman              Human
    ## 70                     Batman              Human
    ## 71                  Batman II              Human
    ## 72                 Battlestar               NULL
    ## 73                 Batwoman V              Human
    ## 74                       Beak               NULL
    ## 75                      Beast             Mutant
    ## 76                  Beast Boy              Human
    ## 77                     Beetle               NULL
    ## 78                     Ben 10               NULL
    ## 79              Beta Ray Bill               NULL
    ## 80                   Beyonder      God / Eternal
    ## 81                  Big Barda            New God
    ## 82                  Big Daddy               NULL
    ## 83                    Big Man               NULL
    ## 84                Bill Harken              Alpha
    ## 85              Billy Kincaid               NULL
    ## 86                     Binary               NULL
    ## 87               Bionic Woman             Cyborg
    ## 88                 Bird-Brain               NULL
    ## 89                   Bird-Man              Human
    ## 90                Bird-Man II              Human
    ## 91                    Birdman      God / Eternal
    ## 92                     Bishop             Mutant
    ## 93                    Bizarro            Bizarro
    ## 94               Black Abbott               NULL
    ## 95                 Black Adam               NULL
    ## 96                 Black Bolt            Inhuman
    ## 97               Black Canary              Human
    ## 98               Black Canary          Metahuman
    ## 99                  Black Cat              Human
    ## 100               Black Flash      God / Eternal
    ## 101             Black Goliath               NULL
    ## 102          Black Knight III              Human
    ## 103           Black Lightning               NULL
    ## 104               Black Mamba               NULL
    ## 105               Black Manta              Human
    ## 106             Black Panther              Human
    ## 107               Black Widow              Human
    ## 108            Black Widow II               NULL
    ## 109                  Blackout              Demon
    ## 110                 Blackwing               NULL
    ## 111                 Blackwulf              Alien
    ## 112                     Blade            Vampire
    ## 113               Blaquesmith               NULL
    ## 114                    Bling!               NULL
    ## 115                     Blink             Mutant
    ## 116                  Blizzard               NULL
    ## 117                  Blizzard               NULL
    ## 118               Blizzard II               NULL
    ## 119                      Blob               NULL
    ## 120                  Bloodaxe              Human
    ## 121                 Bloodhawk             Mutant
    ## 122               Bloodwraith               NULL
    ## 123               Blue Beetle               NULL
    ## 124               Blue Beetle               NULL
    ## 125            Blue Beetle II               NULL
    ## 126           Blue Beetle III              Human
    ## 127                 Boba Fett      Human / Clone
    ## 128                      Bolt               NULL
    ## 129                Bomb Queen               NULL
    ## 130                 Boom-Boom             Mutant
    ## 131                    Boomer               NULL
    ## 132              Booster Gold              Human
    ## 133                       Box               NULL
    ## 134                   Box III               NULL
    ## 135                    Box IV               NULL
    ## 136                  Brainiac            Android
    ## 137                Brainiac 5               NULL
    ## 138            Brother Voodoo              Human
    ## 139                Brundlefly             Mutant
    ## 140                     Buffy              Human
    ## 141                  Bullseye              Human
    ## 142                 Bumblebee              Human
    ## 143                 Bumbleboy               NULL
    ## 144                   Bushido              Human
    ## 145                     Cable             Mutant
    ## 146                  Callisto               NULL
    ## 147             Cameron Hicks              Alpha
    ## 148                Cannonball               NULL
    ## 149           Captain America              Human
    ## 150              Captain Atom  Human / Radiation
    ## 151           Captain Britain              Human
    ## 152              Captain Cold              Human
    ## 153              Captain Epic               NULL
    ## 154         Captain Hindsight              Human
    ## 155          Captain Mar-vell               NULL
    ## 156            Captain Marvel              Human
    ## 157            Captain Marvel         Human-Kree
    ## 158         Captain Marvel II              Human
    ## 159          Captain Midnight              Human
    ## 160            Captain Planet      God / Eternal
    ## 161          Captain Universe      God / Eternal
    ## 162                   Carnage           Symbiote
    ## 163                       Cat               NULL
    ## 164                    Cat II               NULL
    ## 165                  Catwoman              Human
    ## 166             Cecilia Reyes               NULL
    ## 167                   Century              Alien
    ## 168                   Cerebra             Mutant
    ## 169                   Chamber             Mutant
    ## 170                 Chameleon               NULL
    ## 171                Changeling               NULL
    ## 172                   Cheetah              Human
    ## 173                Cheetah II              Human
    ## 174               Cheetah III              Human
    ## 175                   Chromos               NULL
    ## 176              Chuck Norris               NULL
    ## 177             Citizen Steel              Human
    ## 178             Claire Bennet               NULL
    ## 179                      Clea               NULL
    ## 180                     Cloak               NULL
    ## 181                Clock King              Human
    ## 182                Cogliostro               NULL
    ## 183              Colin Wagner               NULL
    ## 184              Colossal Boy               NULL
    ## 185                  Colossus             Mutant
    ## 186                   Copycat             Mutant
    ## 187                   Corsair               NULL
    ## 188               Cottonmouth              Human
    ## 189          Crimson Crusader               NULL
    ## 190            Crimson Dynamo               NULL
    ## 191                   Crystal            Inhuman
    ## 192                     Curse               NULL
    ## 193                    Cy-Gor               NULL
    ## 194                    Cyborg             Cyborg
    ## 195           Cyborg Superman             Cyborg
    ## 196                   Cyclops             Mutant
    ## 197                    Cypher               NULL
    ## 198                    Dagger               NULL
    ## 199              Danny Cooper               NULL
    ## 200             Daphne Powell               NULL
    ## 201                 Daredevil              Human
    ## 202                  Darkhawk              Human
    ## 203                   Darkman               NULL
    ## 204                  Darkseid            New God
    ## 205                  Darkside               NULL
    ## 206                  Darkstar             Mutant
    ## 207                Darth Maul Dathomirian Zabrak
    ## 208               Darth Vader             Cyborg
    ## 209                      Dash              Human
    ## 210                      Data            Android
    ## 211                   Dazzler             Mutant
    ## 212                   Deadman              Human
    ## 213                  Deadpool             Mutant
    ## 214                  Deadshot              Human
    ## 215                  Deathlok             Cyborg
    ## 216               Deathstroke              Human
    ## 217                Demogoblin              Demon
    ## 218                 Destroyer               NULL
    ## 219               Diamondback              Human
    ## 220                DL Hawkins               NULL
    ## 221                Doc Samson  Human / Radiation
    ## 222               Doctor Doom              Human
    ## 223            Doctor Doom II               NULL
    ## 224               Doctor Fate              Human
    ## 225            Doctor Octopus              Human
    ## 226            Doctor Strange              Human
    ## 227                    Domino              Human
    ## 228                 Donatello             Mutant
    ## 229                Donna Troy             Amazon
    ## 230                  Doomsday              Alien
    ## 231              Doppelganger               NULL
    ## 232                  Dormammu               NULL
    ## 233              Dr Manhattan     Human / Cosmic
    ## 234        Drax the Destroyer    Human / Altered
    ## 235                       Ego               NULL
    ## 236                Elastigirl              Human
    ## 237                   Electro              Human
    ## 238                   Elektra              Human
    ## 239               Elle Bishop               NULL
    ## 240             Elongated Man               NULL
    ## 241                Emma Frost               NULL
    ## 242               Enchantress              Human
    ## 243                    Energy               NULL
    ## 244                     ERG-1               NULL
    ## 245                Ethan Hunt              Human
    ## 246                   Etrigan              Demon
    ## 247             Evil Deadpool             Mutant
    ## 248                  Evilhawk              Alien
    ## 249                    Exodus             Mutant
    ## 250             Fabian Cortez               NULL
    ## 251                    Falcon              Human
    ## 252             Fallen One II               NULL
    ## 253                     Faora         Kryptonian
    ## 254                     Feral               NULL
    ## 255           Fighting Spirit               NULL
    ## 256             Fin Fang Foom    Kakarantharaian
    ## 257                  Firebird               NULL
    ## 258                  Firelord               NULL
    ## 259                  Firestar             Mutant
    ## 260                 Firestorm              Human
    ## 261                 Firestorm               NULL
    ## 262                     Fixer               NULL
    ## 263                     Flash              Human
    ## 264              Flash Gordon               NULL
    ## 265                  Flash II              Human
    ## 266                 Flash III              Human
    ## 267                  Flash IV              Human
    ## 268                     Forge               NULL
    ## 269         Franklin Richards             Mutant
    ## 270            Franklin Storm               NULL
    ## 271                    Frenzy               NULL
    ## 272                    Frigga               NULL
    ## 273                  Galactus      Cosmic Entity
    ## 274                    Gambit             Mutant
    ## 275                    Gamora      Zen-Whoberian
    ## 276               Garbage Man             Mutant
    ## 277                 Gary Bell              Alpha
    ## 278               General Zod         Kryptonian
    ## 279                   Genesis               NULL
    ## 280               Ghost Rider              Demon
    ## 281            Ghost Rider II               NULL
    ## 282                 Giant-Man              Human
    ## 283              Giant-Man II               NULL
    ## 284                   Giganta               NULL
    ## 285                 Gladiator          Strontian
    ## 286              Goblin Queen               NULL
    ## 287                  Godzilla              Kaiju
    ## 288                       Gog               NULL
    ## 289                      Goku             Saiyan
    ## 290                   Goliath              Human
    ## 291                   Goliath              Human
    ## 292                   Goliath               NULL
    ## 293                Goliath IV               NULL
    ## 294             Gorilla Grodd            Gorilla
    ## 295           Granny Goodness               NULL
    ## 296                   Gravity              Human
    ## 297                    Greedo             Rodian
    ## 298               Green Arrow              Human
    ## 299              Green Goblin              Human
    ## 300           Green Goblin II               NULL
    ## 301          Green Goblin III               NULL
    ## 302           Green Goblin IV               NULL
    ## 303                     Groot     Flora Colossus
    ## 304                  Guardian              Human
    ## 305               Guy Gardner    Human-Vuldarian
    ## 306                Hal Jordan              Human
    ## 307                  Han Solo              Human
    ## 308                   Hancock              Human
    ## 309              Harley Quinn              Human
    ## 310              Harry Potter              Human
    ## 311                     Havok             Mutant
    ## 312                      Hawk               NULL
    ## 313                   Hawkeye              Human
    ## 314                Hawkeye II              Human
    ## 315                  Hawkgirl               NULL
    ## 316                   Hawkman               NULL
    ## 317                 Hawkwoman               NULL
    ## 318              Hawkwoman II               NULL
    ## 319             Hawkwoman III               NULL
    ## 320                 Heat Wave              Human
    ## 321                      Hela          Asgardian
    ## 322                   Hellboy              Demon
    ## 323                   Hellcat              Human
    ## 324                 Hellstorm               NULL
    ## 325                  Hercules           Demi-God
    ## 326             Hiro Nakamura               NULL
    ## 327                  Hit-Girl              Human
    ## 328                 Hobgoblin               NULL
    ## 329                    Hollow               NULL
    ## 330              Hope Summers               NULL
    ## 331           Howard the Duck               NULL
    ## 332                      Hulk  Human / Radiation
    ## 333               Human Torch  Human / Radiation
    ## 334                  Huntress               NULL
    ## 335                      Husk             Mutant
    ## 336                    Hybrid           Symbiote
    ## 337                 Hydro-Man               NULL
    ## 338                  Hyperion            Eternal
    ## 339                    Iceman             Mutant
    ## 340                   Impulse              Human
    ## 341             Indiana Jones              Human
    ## 342                    Indigo              Alien
    ## 343                       Ink             Mutant
    ## 344           Invisible Woman  Human / Radiation
    ## 345                 Iron Fist              Human
    ## 346                  Iron Man              Human
    ## 347               Iron Monger               NULL
    ## 348                      Isis               NULL
    ## 349                Jack Bauer               NULL
    ## 350            Jack of Hearts              Human
    ## 351                 Jack-Jack              Human
    ## 352                James Bond              Human
    ## 353             James T. Kirk              Human
    ## 354             Jar Jar Binks             Gungan
    ## 355              Jason Bourne              Human
    ## 356                 Jean Grey             Mutant
    ## 357           Jean-Luc Picard              Human
    ## 358             Jennifer Kale               NULL
    ## 359               Jesse Quick              Human
    ## 360              Jessica Cruz              Human
    ## 361             Jessica Jones              Human
    ## 362           Jessica Sanders               NULL
    ## 363                    Jigsaw               NULL
    ## 364                Jim Powell               NULL
    ## 365                 JJ Powell               NULL
    ## 366             Johann Krauss               NULL
    ## 367          John Constantine              Human
    ## 368              John Stewart              Human
    ## 369               John Wraith               NULL
    ## 370                     Joker              Human
    ## 371                      Jolt               NULL
    ## 372                   Jubilee             Mutant
    ## 373               Judge Dredd              Human
    ## 374                Juggernaut              Human
    ## 375                  Junkpile             Mutant
    ## 376                   Justice              Human
    ## 377                  Jyn Erso              Human
    ## 378                     K-2SO            Android
    ## 379                      Kang               NULL
    ## 380                Karate Kid              Human
    ## 381           Kathryn Janeway              Human
    ## 382          Katniss Everdeen              Human
    ## 383                  Kevin 11              Human
    ## 384                  Kick-Ass              Human
    ## 385                 Kid Flash              Human
    ## 386              Kid Flash II               NULL
    ## 387               Killer Croc          Metahuman
    ## 388              Killer Frost              Human
    ## 389                   Kilowog         Bolovaxian
    ## 390                 King Kong             Animal
    ## 391                King Shark             Animal
    ## 392                   Kingpin              Human
    ## 393                      Klaw              Human
    ## 394              Kool-Aid Man               NULL
    ## 395                 Kraven II              Human
    ## 396         Kraven the Hunter              Human
    ## 397                    Krypto         Kryptonian
    ## 398               Kyle Rayner              Human
    ## 399                  Kylo Ren              Human
    ## 400             Lady Bullseye               NULL
    ## 401          Lady Deathstrike             Cyborg
    ## 402                    Leader               NULL
    ## 403                     Leech               NULL
    ## 404                    Legion             Mutant
    ## 405                  Leonardo             Mutant
    ## 406                Lex Luthor              Human
    ## 407                Light Lass               NULL
    ## 408             Lightning Lad               NULL
    ## 409            Lightning Lord               NULL
    ## 410              Living Brain               NULL
    ## 411           Living Tribunal      Cosmic Entity
    ## 412               Liz Sherman               NULL
    ## 413                    Lizard              Human
    ## 414                      Lobo           Czarnian
    ## 415                      Loki          Asgardian
    ## 416                  Longshot              Human
    ## 417                 Luke Cage              Human
    ## 418             Luke Campbell               NULL
    ## 419            Luke Skywalker              Human
    ## 420                      Luna              Human
    ## 421                      Lyja               NULL
    ## 422                   Mach-IV               NULL
    ## 423               Machine Man               NULL
    ## 424                   Magneto             Mutant
    ## 425                     Magog               NULL
    ## 426                     Magus               NULL
    ## 427           Man of Miracles      God / Eternal
    ## 428                   Man-Bat              Human
    ## 429                 Man-Thing               NULL
    ## 430                  Man-Wolf               NULL
    ## 431                  Mandarin              Human
    ## 432                    Mantis         Human-Kree
    ## 433         Martian Manhunter            Martian
    ## 434               Marvel Girl               NULL
    ## 435              Master Brood               NULL
    ## 436              Master Chief    Human / Altered
    ## 437                     Match               NULL
    ## 438              Matt Parkman               NULL
    ## 439                  Maverick               NULL
    ## 440                    Maxima               NULL
    ## 441              Maya Herrera               NULL
    ## 442                    Medusa            Inhuman
    ## 443                  Meltdown               NULL
    ## 444                  Mephisto               NULL
    ## 445                      Mera          Atlantean
    ## 446                   Metallo            Android
    ## 447                Metamorpho               NULL
    ## 448                 Meteorite               NULL
    ## 449                    Metron               NULL
    ## 450             Micah Sanders               NULL
    ## 451              Michelangelo             Mutant
    ## 452                 Micro Lad               NULL
    ## 453                     Mimic               NULL
    ## 454              Minna Murray               NULL
    ## 455                    Misfit               NULL
    ## 456              Miss Martian               NULL
    ## 457          Mister Fantastic  Human / Radiation
    ## 458             Mister Freeze              Human
    ## 459              Mister Knife            Spartoi
    ## 460           Mister Mxyzptlk      God / Eternal
    ## 461           Mister Sinister    Human / Altered
    ## 462              Mister Zsasz              Human
    ## 463               Mockingbird              Human
    ## 464                     MODOK             Cyborg
    ## 465                      Mogo             Planet
    ## 466           Mohinder Suresh               NULL
    ## 467                    Moloch               NULL
    ## 468                Molten Man               NULL
    ## 469                   Monarch               NULL
    ## 470             Monica Dawson               NULL
    ## 471               Moon Knight              Human
    ## 472                 Moonstone               NULL
    ## 473                    Morlun               NULL
    ## 474                     Morph               NULL
    ## 475              Moses Magnum               NULL
    ## 476               Mr Immortal             Mutant
    ## 477             Mr Incredible              Human
    ## 478              Ms Marvel II               NULL
    ## 479              Multiple Man               NULL
    ## 480                  Mysterio              Human
    ## 481                  Mystique             Mutant
    ## 482                     Namor          Atlantean
    ## 483                     Namor               NULL
    ## 484                    Namora               NULL
    ## 485                  Namorita               NULL
    ## 486            Naruto Uzumaki              Human
    ## 487           Nathan Petrelli               NULL
    ## 488                    Nebula          Luphomoid
    ## 489 Negasonic Teenage Warhead             Mutant
    ## 490                 Nick Fury              Human
    ## 491              Nightcrawler               NULL
    ## 492                 Nightwing              Human
    ## 493              Niki Sanders               NULL
    ## 494              Nina Theroux              Alpha
    ## 495               Nite Owl II               NULL
    ## 496                 Northstar               NULL
    ## 497                      Nova              Human
    ## 498                      Nova     Human / Cosmic
    ## 499                      Odin      God / Eternal
    ## 500                 Offspring               NULL
    ## 501                 Omega Red               NULL
    ## 502                Omniscient               NULL
    ## 503             One Punch Man              Human
    ## 504             One-Above-All      Cosmic Entity
    ## 505                 Onslaught             Mutant
    ## 506                    Oracle              Human
    ## 507                    Osiris               NULL
    ## 508                 Overtkill               NULL
    ## 509                Ozymandias              Human
    ## 510                 Parademon          Parademon
    ## 511                Paul Blart              Human
    ## 512                   Penance               NULL
    ## 513                 Penance I               NULL
    ## 514                Penance II               NULL
    ## 515                   Penguin              Human
    ## 516            Peter Petrelli               NULL
    ## 517                   Phantom               NULL
    ## 518              Phantom Girl               NULL
    ## 519                   Phoenix             Mutant
    ## 520                  Plantman             Mutant
    ## 521               Plastic Lad               NULL
    ## 522               Plastic Man              Human
    ## 523                 Plastique               NULL
    ## 524                Poison Ivy              Human
    ## 525                   Polaris             Mutant
    ## 526                Power Girl         Kryptonian
    ## 527                 Power Man             Mutant
    ## 528                  Predator             Yautja
    ## 529               Professor X             Mutant
    ## 530            Professor Zoom              Human
    ## 531              Proto-Goblin               NULL
    ## 532                  Psylocke             Mutant
    ## 533                  Punisher              Human
    ## 534                Purple Man              Human
    ## 535                      Pyro               NULL
    ## 536                         Q      God / Eternal
    ## 537                   Quantum               NULL
    ## 538                  Question              Human
    ## 539               Quicksilver             Mutant
    ## 540                     Quill               NULL
    ## 541              Ra's Al Ghul              Human
    ## 542             Rachel Pirzad              Alpha
    ## 543                     Rambo              Human
    ## 544                   Raphael             Mutant
    ## 545                     Raven              Human
    ## 546                       Ray              Human
    ## 547             Razor-Fist II               NULL
    ## 548                 Red Arrow              Human
    ## 549                  Red Hood              Human
    ## 550                  Red Hulk  Human / Radiation
    ## 551                  Red Mist               NULL
    ## 552                 Red Robin              Human
    ## 553                 Red Skull               NULL
    ## 554               Red Tornado            Android
    ## 555               Redeemer II               NULL
    ## 556              Redeemer III               NULL
    ## 557              Renata Soliz               NULL
    ## 558                       Rey              Human
    ## 559                     Rhino  Human / Radiation
    ## 560                 Rick Flag               NULL
    ## 561                   Riddler               NULL
    ## 562                Rip Hunter              Human
    ## 563                   Ripcord               NULL
    ## 564                     Robin              Human
    ## 565                  Robin II              Human
    ## 566                 Robin III              Human
    ## 567                   Robin V              Human
    ## 568                  Robin VI              Human
    ## 569            Rocket Raccoon             Animal
    ## 570                     Rogue               NULL
    ## 571                     Ronin              Human
    ## 572                 Rorschach              Human
    ## 573                Sabretooth             Mutant
    ## 574                      Sage               NULL
    ## 575                   Sandman              Human
    ## 576                 Sasquatch               NULL
    ## 577                    Sauron              Maiar
    ## 578             Savage Dragon               NULL
    ## 579                 Scarecrow              Human
    ## 580            Scarlet Spider              Human
    ## 581         Scarlet Spider II              Clone
    ## 582             Scarlet Witch             Mutant
    ## 583                   Scorpia               NULL
    ## 584                  Scorpion              Human
    ## 585            Sebastian Shaw             Mutant
    ## 586                    Sentry             Mutant
    ## 587               Shadow King               NULL
    ## 588               Shadow Lass           Talokite
    ## 589                 Shadowcat             Mutant
    ## 590                 Shang-Chi              Human
    ## 591               Shatterstar               NULL
    ## 592                  She-Hulk              Human
    ## 593                 She-Thing  Human / Radiation
    ## 594                   Shocker              Human
    ## 595                    Shriek               NULL
    ## 596          Shrinking Violet               NULL
    ## 597                       Sif          Asgardian
    ## 598                      Silk              Human
    ## 599              Silk Spectre               NULL
    ## 600           Silk Spectre II               NULL
    ## 601             Silver Surfer              Alien
    ## 602                Silverclaw               NULL
    ## 603                 Simon Baz              Human
    ## 604                  Sinestro          Korugaran
    ## 605                     Siren          Atlantean
    ## 606                  Siren II               NULL
    ## 607                     Siryn               NULL
    ## 608                     Skaar               NULL
    ## 609                Snake-Eyes             Animal
    ## 610                  Snowbird               NULL
    ## 611                     Sobek               NULL
    ## 612            Solomon Grundy             Zombie
    ## 613                  Songbird               NULL
    ## 614               Space Ghost              Human
    ## 615                     Spawn              Demon
    ## 616                   Spectre      God / Eternal
    ## 617                 Speedball               NULL
    ## 618                    Speedy              Human
    ## 619                    Speedy              Human
    ## 620            Spider-Carnage           Symbiote
    ## 621               Spider-Girl              Human
    ## 622               Spider-Gwen              Human
    ## 623                Spider-Man              Human
    ## 624                Spider-Man              Human
    ## 625                Spider-Man              Human
    ## 626              Spider-Woman              Human
    ## 627           Spider-Woman II               NULL
    ## 628          Spider-Woman III               NULL
    ## 629           Spider-Woman IV               NULL
    ## 630                     Spock       Human-Vulcan
    ## 631                     Spyke             Mutant
    ## 632                   Stacy X               NULL
    ## 633                 Star-Lord      Human-Spartoi
    ## 634                  Stardust               NULL
    ## 635                  Starfire         Tamaranean
    ## 636                  Stargirl              Human
    ## 637                    Static             Mutant
    ## 638                     Steel               NULL
    ## 639          Stephanie Powell               NULL
    ## 640               Steppenwolf            New God
    ## 641                     Storm             Mutant
    ## 642              Stormtrooper              Human
    ## 643                   Sunspot             Mutant
    ## 644                  Superboy               NULL
    ## 645            Superboy-Prime         Kryptonian
    ## 646                 Supergirl         Kryptonian
    ## 647                  Superman         Kryptonian
    ## 648               Swamp Thing      God / Eternal
    ## 649                     Swarm             Mutant
    ## 650                     Sylar               NULL
    ## 651                     Synch               NULL
    ## 652                    T-1000            Android
    ## 653                     T-800             Cyborg
    ## 654                     T-850             Cyborg
    ## 655                       T-X             Cyborg
    ## 656                Taskmaster              Human
    ## 657                   Tempest               NULL
    ## 658                    Thanos            Eternal
    ## 659                  The Cape               NULL
    ## 660              The Comedian              Human
    ## 661                     Thing  Human / Radiation
    ## 662                      Thor          Asgardian
    ## 663                 Thor Girl          Asgardian
    ## 664               Thunderbird               NULL
    ## 665            Thunderbird II               NULL
    ## 666           Thunderbird III               NULL
    ## 667             Thunderstrike               NULL
    ## 668                   Thundra               NULL
    ## 669               Tiger Shark              Human
    ## 670                     Tigra               NULL
    ## 671                  Tinkerer               NULL
    ## 672                     Titan               NULL
    ## 673                      Toad             Mutant
    ## 674                     Toxin           Symbiote
    ## 675                     Toxin           Symbiote
    ## 676             Tracy Strauss               NULL
    ## 677                 Trickster              Human
    ## 678                    Trigon      God / Eternal
    ## 679           Triplicate Girl               NULL
    ## 680                    Triton            Inhuman
    ## 681                  Two-Face               NULL
    ## 682                 Ultragirl               NULL
    ## 683                    Ultron            Android
    ## 684               Utgard-Loki        Frost Giant
    ## 685                  Vagabond               NULL
    ## 686              Valerie Hart               NULL
    ## 687                  Valkyrie               NULL
    ## 688                  Vanisher               NULL
    ## 689                    Vegeta             Saiyan
    ## 690                     Venom           Symbiote
    ## 691                  Venom II               NULL
    ## 692                 Venom III           Symbiote
    ## 693                 Venompool           Symbiote
    ## 694                Vertigo II               NULL
    ## 695                      Vibe              Human
    ## 696                Vindicator              Human
    ## 697                Vindicator               NULL
    ## 698                  Violator               NULL
    ## 699               Violet Parr              Human
    ## 700                    Vision            Android
    ## 701                 Vision II               NULL
    ## 702                     Vixen              Human
    ## 703                    Vulcan               NULL
    ## 704                   Vulture              Human
    ## 705                    Walrus              Human
    ## 706               War Machine              Human
    ## 707                   Warbird               NULL
    ## 708                   Warlock               NULL
    ## 709                      Warp               NULL
    ## 710                   Warpath             Mutant
    ## 711                      Wasp              Human
    ## 712                   Watcher               NULL
    ## 713                 Weapon XI               NULL
    ## 714              White Canary              Human
    ## 715               White Queen               NULL
    ## 716                  Wildfire               NULL
    ## 717            Winter Soldier              Human
    ## 718                   Wiz Kid               NULL
    ## 719                 Wolfsbane               NULL
    ## 720                 Wolverine             Mutant
    ## 721               Wonder Girl           Demi-God
    ## 722                Wonder Man               NULL
    ## 723              Wonder Woman             Amazon
    ## 724                    Wondra               NULL
    ## 725            Wyatt Wingfoot               NULL
    ## 726                      X-23     Mutant / Clone
    ## 727                     X-Man               NULL
    ## 728               Yellow Claw               NULL
    ## 729              Yellowjacket              Human
    ## 730           Yellowjacket II              Human
    ## 731                      Ymir        Frost Giant
    ## 732                      Yoda     Yoda's species
    ## 733                   Zatanna              Human
    ## 734                      Zoom               NULL

Ejercicio 12 GROUP BY

``` r
dbGetQuery(mydb, paste("SELECT Publisher, Gender, COUNT(Gender) ", 
                       "FROM heroes_information ",
                       "WHERE Gender='Female' ",
                       "GROUP BY Publisher ORDER BY COUNT(Gender) DESC;",
                       sep = ""))
```

    ##            Publisher Gender COUNT(Gender)
    ## 1      Marvel Comics Female           111
    ## 2          DC Comics Female            61
    ## 3       NBC - Heroes Female             7
    ## 4  Dark Horse Comics Female             5
    ## 5       Image Comics Female             2
    ## 6               <NA> Female             2
    ## 7               SyFy Female             2
    ## 8      HarperCollins Female             2
    ## 9       George Lucas Female             2
    ## 10       ABC Studios Female             2
    ## 11       Icon Comics Female             1
    ## 12         Star Trek Female             1
    ## 13         Wildstorm Female             1
    ## 14      Team Epic TV Female             1

Ejercicio 13 HAVING

``` r
dbGetQuery(mydb, paste("SELECT Publisher, Alignment, Race, COUNT(*) ", 
                       "FROM heroes_information ",
                       "WHERE Alignment='good' ",
                       "GROUP BY Publisher ",
                       "HAVING COUNT(*)>30;",
                       sep = ""))
```

    ##       Publisher Alignment    Race COUNT(*)
    ## 1     DC Comics      good Ungaran      142
    ## 2 Marvel Comics      good   Human      259
