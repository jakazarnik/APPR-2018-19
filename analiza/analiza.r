library(dplyr)

tabela_prebivalstva <- starostne_skupine %>% group_by(regija, leto) %>% summarise(stevilo=sum(stevilo))

tabela_gostota <- tabela_prebivalstva %>%
  inner_join(povrsine) %>% mutate(gostota=round(stevilo/povrsina_km2, 2))

gostota_graf <- function(ime) {
  ggplot(tabela_gostota %>% filter(regija==ime), aes(x=leto, y=gostota)) + 
    geom_line() +
    ggtitle("") + xlab("Leto") + ylab("Število prebivalcev")
}
