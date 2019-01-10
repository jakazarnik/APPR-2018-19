library(ggplot2)

#ZEMLJEVID
# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source('lib/uvozi.zemljevid.r')

#Graf: Zemljevid

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1") %>% fortify()


ggplot(Slovenija, aes(x=long, y=lat, group=group, fill=NAME_1)) +
  geom_polygon() +
  labs(title="Slovenija - brez podatkov") +
  theme(legend.position="none")


#GRAFI

gibanje_prebivalstva <- ggplot(data = gibanje_celotnega_prebivalstva, mapping = aes(x=leto, y=prebivalstvo_1_januar)) + geom_line()
plot(gibanje_prebivalstva)
                    
povrsine_cake <- ggplot(data = povrsine, mapping = aes(x="", y=povrsina_km2, fill=regija)) + geom_bar(width = 1, stat = "identity")
povrsine_cake <- povrsine_cake + coord_polar(theta = "y") + theme_void()
plot(povrsine_cake)
