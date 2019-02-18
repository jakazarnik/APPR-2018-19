library(dplyr)

gostota_graf1 <- function(ime) {
  ggplot(tabela_gostota %>% filter(regija==ime), aes(x=leto, y=gostota)) + 
    geom_line() +
    ggtitle("") + xlab("Leto") + ylab('št. prebivlacev/km^2')
}

gostota_graf2 <- function(cifra) {
  ggplot(tabela_gostota %>% filter(leto==cifra), aes(x=regija, y=gostota)) + 
    ylim(0, 250) + geom_bar(stat = "identity", fill = "springgreen3") +
    ggtitle("") + xlab("") + ylab("št. prebivlacev/km^2")
}

