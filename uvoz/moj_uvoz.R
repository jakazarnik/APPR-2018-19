
loc <- locale(encoding = "Windows-1250", decimal_mark = ".")
loc2 <- locale(encoding = "UTF-8", decimal_mark = ".")
loc3 <- locale(encoding = "ISO-8859-1", decimal_mark = ".")

#tabela 1:
gibanje_celotnega_prebivalstva <- read_csv2(file = 'podatki/T1_preb_zivorojeni_umrli_nar.prirast.csv',
                                                   col_names=TRUE, skip=2, locale=loc2)

gibanje_celotnega_prebivalstva <- gibanje_celotnega_prebivalstva[, c(1:4)] %>% 
  mutate(prebivalstvo_1_januar=round(prebivalstvo_1_januar/1000, 1))

#tabela povrsine:
povrsine <- read_csv2(file = 'podatki/povrsine_regije.csv', locale=loc2) %>% mutate(povrsina_km2=as.numeric(povrsina_km2))

#tabela 2:
zivorojeni <- read_csv2(file = 'podatki/rojstva_regije.csv', skip=2,
                        col_names = c("regija", "leto", "spol", "stevilo"), locale=loc)

zivorojeni <- zivorojeni %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 3:
umrli <- read_csv2(file = 'podatki/smrti_regije.csv', skip=2,
                   col_names = c("regija", "leto", "spol", "stevilo"), locale=loc)

umrli <- umrli %>% fill(regija, leto) %>% filter(stevilo!=" ")


#tabela 4:
selitve <- read_csv2(file = 'podatki/tabela_selitve.csv', skip=2,
                     col_names = c("regija", "leto", "vrsta selitve", "stevilo"), locale=loc)

selitve <- selitve %>% fill(regija, leto) %>% filter(stevilo!=" ")

tabela_selitve <- selitve %>% group_by(regija) %>% summarise(stevilo=sum(stevilo)) %>%
  inner_join(povrsine) %>% mutate(priseljeni=round(stevilo/povrsina_km2, 2))


#tabela 5:
starostne_skupine <- read_csv2(file = 'podatki/starostne_skupine.csv', skip=3,
                               col_names = c("regija", "leto", "starostna skupina", "stevilo"), locale = loc2)

starostne_skupine <- starostne_skupine %>% fill(regija, leto) %>% filter(stevilo!=" ")

tabela_mladi <- starostne_skupine %>% filter(`starostna skupina`=='0-14 let') %>% filter(`regija`=='Osrednjeslovenska')


#GOSTOTA
tabela_prebivalstva <- starostne_skupine %>% group_by(regija, leto) %>% summarise(stevilo=sum(stevilo))

tabela_gostota <- tabela_prebivalstva %>%
  inner_join(povrsine) %>% mutate(gostota=round(stevilo/povrsina_km2, 2))

#rojeni umrli prisljeni
tabela_umrli <- umrli %>% group_by(regija, spol) %>% summarise(stevilo=sum(stevilo))
tabela_umrli[tabela_umrli=="Umrli - ženske"] <-'zenska'
tabela_umrli[tabela_umrli=='Umrli - moški'] <-'moski'
tabela_umrli$stanje <- 'umrli'
tabela_umrli <- tabela_umrli[c(1,4,2,3)]

tabela_rojeni <- zivorojeni %>% group_by(regija, spol) %>% summarise(stevilo=sum(stevilo))
tabela_rojeni[tabela_rojeni=='živorojeni - ženske'] <-'zenska'
tabela_rojeni[tabela_rojeni=='živorojeni - moški'] <-'moski'
tabela_rojeni$stanje <- 'rojeni'
tabela_rojeni <- tabela_rojeni[c(1,4,2,3)]


tabela_rojeni_umrli <- full_join(tabela_umrli, tabela_rojeni)
tabela_rojeni_umrli <- tabela_rojeni_umrli[!tabela_rojeni_umrli$regija == "SLOVENIJA", ]
#dtfm[!dtfm$C == "Foo", ]