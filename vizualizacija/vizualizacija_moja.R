# # Uvozimo funkcije za pobiranje in uvoz zemljevida.
# source("lib/uvozi.zemljevid.r", encoding="UTF-8")
# 
# 
# # Uvozimo zemljevid.
# # zemljevid <- uvozi.zemljevid('https://gadm.org/maps/SVN_1.html', "Zemljevid",
# #                              pot.zemljevida="", encoding="Windows-1250")
# # levels(zemljevid$OB_UIME) <- levels(zemljevid$OB_UIME) %>%
# # { gsub("Slovenskih", "Slov.", .) } %>% { gsub("-", " - ", .) }
# # zemljevid$OB_UIME <- factor(zemljevid$OB_UIME, levels=levels(obcine$obcina))
# # zemljevid <- fortify(zemljevid)

gibanje_prebivalstva <- ggplot(data = gibanje_celotnega_prebivalstva, mapping = aes(x=leto, y=Prebivalstvo - 1. januar))

                               