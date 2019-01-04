library(readr)
library(dplyr)
library(tidyr)

tabela_1 <- read_csv2('podatki/T1_preb_zivorojeni_umrli_nar.prirast.csv', col_names=TRUE, skip=2, locale=locale(encoding="UTF-8"))
tabela_2 <- read_csv2('podatki/T2_spol-umrli_rojeni.csv', col_names=TRUE, skip=2, locale=locale(encoding="UTF-8"))
tabela_3 <- read_csv2('podatki/T3_selitveni-tujina_regije.csv', col_names=TRUE, skip=2, locale=locale(encoding="UTF-8"))
tabela_4 <- read_csv2('podatki/T4_regije_preb_star.skupine.csv', col_names=TRUE, skip=2, locale=locale(encoding="UTF-8"))

tabela_rojstva <- read.csv2('podatki/rojstva_regije.csv', header=FALSE, skip=2, encoding='Windows-1250',
                            col.names = c("regija", "leto", "spol", "stevilo"))
tabela_rojstva <- tabela_rojstva %>% fill(regija, leto, .direction = "up") 
