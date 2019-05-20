library(dplyr)

gostota_graf1 <- function(ime) {
  ggplot(tabela_gostota %>% filter(regija==ime), aes(x=leto, y=gostota)) + 
    geom_line() +
    ggtitle("") + xlab("Leto") + ylab('Št. prebivlacev/km^2')
}

gostota_graf2 <- function(cifra) {
  ggplot(tabela_gostota %>% filter(leto==cifra), aes(x=regija, y=gostota)) + 
    ylim(0, 250) + geom_bar(stat = "identity", fill = "springgreen3") +
    ggtitle("") + xlab("") + ylab("Št. prebivlacev/km^2")
}

#Napredna analiza - napoved stevila mladih

fit <- lm(data = tabela_mladi, stevilo ~ leto + I(leto^2))

cas <- data.frame(leto=seq(1995, 2025, 2))

predict(fit, cas)

napoved <- cas %>% mutate(stevilo=predict(fit, cas))

mladi_graf3 <- ggplot(tabela_mladi, aes(x=leto, y=stevilo/1000)) +
  geom_smooth(method = "lm", formula = y ~ x + I(x^2), fullrange = TRUE) +
  geom_point(data=napoved, color="red") +
  labs(title="Mlajše prebivalstvo osrednjeslovenske regije", y="Prebivalci 0-14let v tisočih") + 
  geom_point()
