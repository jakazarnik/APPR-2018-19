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

fit <- lm(data = tabela_mladi, stevilo ~ leto)

cas <- data.frame(leto=seq(1995, 2030, 2))

predict(fit, cas)

napoved <- cas %>% mutate(stevilo=predict(fit, cas))

mladi_graf3 <- ggplot(napoved, aes(x=leto, y=stevilo)) +
  scale_y_continuous(limits = c(30000, 50000)) +
  geom_smooth(method=lm, se=FALSE, fullrange = TRUE) +
  geom_point(data=napoved, color="red", size=2) +
  labs(title="Napoved števila mladih", y="število prebivalcev 0-14let") + 
  geom_point()

plot(mladi_graf3)
