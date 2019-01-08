library(readr)
library(dplyr)
library(tidyr)


#tabela 1
tabela_gibanje_celotnega_prebivalstva <- read_csv2(file = 'podatki/T1_preb_zivorojeni_umrli_nar.prirast.csv',
                                                   col_names=TRUE, skip=2, locale=locale(encoding="UTF-8"))

tabela_gibanje_celotnega_prebivalstva <-tabela_gibanje_celotnega_prebivalstva[, c(1:4)]


#tabela 2
tabela_zivorojeni <- read.csv2(file = 'podatki/rojstva_regije.csv', header=FALSE, skip=2, encoding='Windows-1250',
                            col.names = c("regija", "leto", "spol", "stevilo"), na=c(" "))

tabela_zivorojeni <- tabela_zivorojeni %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 3
tabela_umrli <- read.csv2(file = 'podatki/smrti_regije.csv', header=FALSE, skip=2, encoding='Windows-1250',
                               col.names = c("regija", "leto", "spol", "stevilo"), na=c(" "))

tabela_umrli <- tabela_umrli %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 4
tabela_selitve <- read.csv2(file = 'podatki/tabela_selitve.csv', header=FALSE, skip=2, encoding='Windows-1250',
                            col.names = c("regija", "leto", "vrsta selitve", "stevilo"), na=c(" "))

tabela_selitve <- tabela_selitve %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 5
tabela_starostne_skupine <- read_csv2(file = 'podatki/05C2002Ss.csv', col_names = c("regija", "leto", "starostna skupina", "stevilo"),
                                      skip=3, locale=locale(encoding="UTF-8"))

tabela_starostne_skupine <- tabela_starostne_skupine %>% fill(regija, leto) %>% filter(stevilo!=" ")

