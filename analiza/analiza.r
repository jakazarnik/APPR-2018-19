library(dplyr)

gostota_graf1 <- function(ime) {
  ggplot(tabela_gostota %>% filter(regija==ime), aes(x=leto, y=gostota)) + 
    geom_line() +
    ggtitle("") + xlab("Leto") + ylab('??t. prebivlacev/km^2')
}

gostota_graf2 <- function(cifra) {
  ggplot(tabela_gostota %>% filter(leto==cifra), aes(x=regija, y=gostota)) + 
    ylim(0, 250) + geom_bar(stat = "identity", fill = "springgreen3") +
    ggtitle("") + xlab("") + ylab("??t. prebivlacev/km^2")
}

#Napredna analiza - napoved stevila mladih

fit <- lm(data = tabela_mladi, leto ~ leto)

a <- data.frame(leto=seq(2016, 2030, 2))

predict(fit, a)

napoved <- a %>% mutate(stevilo=predict(fit, .))

mladi_graf3 <- ggplot(napoved, aes(x=leto, y=stevilo)) +
  geom_smooth(method=lm, se=FALSE, fullrange = TRUE) +
  geom_point(data=napoved, aes(x=leto, y=leto), color="orange", size=3) +
  labs(title="Napoved ??tevila mladih", y="??tevilo prebivalcev 0-14let") + 
  geom_point()
