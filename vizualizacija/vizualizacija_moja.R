library(ggplot2)

#ZEMLJEVID
# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source('lib/uvozi.zemljevid.r')

#Graf: Zemljevid

Slovenija <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8") %>% fortify()

Slovenija=Slovenija %>%  mutate(NAME_1 = replace(NAME_1 %>% as.character,NAME_1=="Spodnjeposavska","Posavska")) %>% 
  mutate(NAME_1 = replace(NAME_1,NAME_1=="Notranjsko-kra\U00161ka","Primorsko-notranjska") %>% as.factor)

selitve <- ggplot(Slovenija, aes(x=long, y=lat, group=group, fill=NAME_1)) +
  geom_polygon(data=left_join(Slovenija, tabela_selitve,
                              by=c("NAME_1"="regija")),
               aes(x=long, y=lat, group=group,
                   fill=priseljeni)) + xlab("") + ylab("") +
  ggtitle("Slovenija - priseljeni v regijo na 1000 prebivalcev") +
  guides(fill=guide_colorbar(title=""))


#GRAFI

# basic_gibanje <- ggplot(gibanje_celotnega_prebivalstva, aes(x=leto, y=prebivalstvo_1_januar)) + 
#   geom_line() +
#   ggtitle("Število prebivalcev Slovenije") + xlab("Leto") + ylab("Število prebivalcev")

gibanje_prebivalstva_dygraph <- function() {
  don<-xts(x = gibanje_celotnega_prebivalstva$prebivalstvo_1_januar, order.by=as.yearqtr.default(gibanje_celotnega_prebivalstva$leto))
  dygraph(don, main = "Gibanje prebivalstva Slovenije", ylab = "prebivalstvo v tisočih") %>%
    dyOptions(labelsUTC = TRUE, fillGraph=TRUE, fillAlpha=0.1, drawGrid = FALSE, colors="#D8AE5A") %>%
    dyRangeSelector() %>%
    dyEvent("1995-1-1", "", labelLoc = "bottom") %>%
    dyCrosshair(direction = "vertical") %>%
    dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2, hideOnMouseOut = FALSE)  %>%
    dyRoller(rollPeriod = 1) %>%
    dySeries("V1", label = "Število prebivalstva")
}

rojstva_smrti <- ggplot(tabela_rojeni_umrli, aes(x=stanje, y=stevilo, fill=spol)) + 
  geom_bar(stat="identity") + facet_grid(~regija) +ggtitle("Rojstva in smrti") + 
  xlab("") + ylab("število") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# gibanje_prebivalstva <- ggplot(data = gibanje_celotnega_prebivalstva, mapping = aes(x=leto, y=prebivalstvo_1_januar)) + geom_line()
# plot(gibanje_prebivalstva)
#                     
# povrsine_cake <- ggplot(data = povrsine, mapping = aes(x="", y=povrsina_km2, fill=regija)) + geom_bar(width = 1, stat = "identity")
# povrsine_cake <- povrsine_cake + coord_polar(theta = "y") + theme_void()
# plot(povrsine_cake)
