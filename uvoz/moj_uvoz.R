library(readr)
library(dplyr)
library(tidyr)


#tabela 1:
gibanje_celotnega_prebivalstva <- read_csv2(file = 'podatki/T1_preb_zivorojeni_umrli_nar.prirast.csv',
                                                   col_names=TRUE, skip=2, locale=locale(encoding="UTF-8"))

gibanje_celotnega_prebivalstva <- gibanje_celotnega_prebivalstva[, c(1:4)]


#tabela 2:
zivorojeni <- read.csv2(file = 'podatki/rojstva_regije.csv', header=FALSE, skip=2, encoding='Windows-1250',
                            col.names = c("regija", "leto", "spol", "stevilo"), na=c(" "))

zivorojeni <- zivorojeni %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 3:
umrli <- read.csv2(file = 'podatki/smrti_regije.csv', header=FALSE, skip=2, encoding='Windows-1250',
                               col.names = c("regija", "leto", "spol", "stevilo"), na=c(" "))

umrli <- umrli %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 4:
selitve <- read.csv2(file = 'podatki/tabela_selitve.csv', header=FALSE, skip=2, encoding='Windows-1250',
                            col.names = c("regija", "leto", "vrsta selitve", "stevilo"), na=c(" "))

selitve <- selitve %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 5:
starostne_skupine <- read_csv2(file = 'podatki/starostne_skupine.csv', col_names = c("regija", "leto", "starostna skupina", "stevilo"),
                                      skip=3, locale=locale(encoding="UTF-8"))

starostne_skupine <- starostne_skupine %>% fill(regija, leto) %>% filter(stevilo!=" ")

#tabela 6:
povrsine <- read_csv2(file = 'podatki/povrsine_regije.csv', col_names = TRUE, locale=locale(encoding="UTF-8"))

#shranjene tabele v tidy data:
write.csv(gibanje_celotnega_prebivalstva, file = 'podatki/tidy_data/TIDY_gibanje_celotnega_prebivalstva.csv')
write.csv(zivorojeni, file = 'podatki/tidy_data/TIDY_zivorojeni.csv')
write.csv(umrli, file = 'podatki/tidy_data/TIDY_umrli.csv')
write.csv(selitve, file = 'podatki/tidy_data/TIDY_selitve.csv')
write.csv(starostne_skupine, file = 'podatki/tidy_data/TIDY_starostne_skupine.csv')
write.csv(povrsine, file = 'podatki/tidy_data/TIDY_povrsine.csv')
