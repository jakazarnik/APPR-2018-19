# Analiza podatkov s programom R, 2018/19

##### Jakob Zarnik

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2018/19

* [![Shiny](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/jakazarnik/APPR-2018-19/master?urlpath=shiny/APPR-2018-19/moj_projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/jakazarnik/APPR-2018-19/master?urlpath=rstudio) RStudio

## Analiza gibanja prebivalstva v Sloveniji

V svojem projektu bom analiziral naravno gibanje prebivalstva v republiki Sloveniji in njenih statističnih regijah.
Zanimal me bo trend naravna rast prebivalstva in skupne spremembe, ki vključujejo tudi selitve.
V prvem delu se bom osredotočil na Slovenijo kot celoto in sicer od leta 1920. Skušal bom prikazati kako je zgodovina vplivala na spremembe. 
V drugem delu bom preučil demografski vpliv na naravni prirast in selitve glede na statistične regije Slovenije po letu 1995. Statistične regije bom primerjal glede na število prebivalstva, gostoto poseljenosti in starostjo prebivalstva ter skušal podatke povezati s spremembami v številu rojstev, smrti in selitev.

### Cilj:
Želim nazorno ponazoriti kdaj se je v Sloveniji spremenil trend naravne rasti prebivalstva iz močno pozitivne na ničelno in negativno. Poskušal bom tudi prikazati kako se je spreminjalo prebivalstvo regij zaradi selitev, predvsem mlajšega prebivalstva, na območja večjih mest.

#### Tabele:

* tabela 1: Slovenija, leto, prebivalstvo, živorojeni, umrli, naravni prirast
* tabela 2: regija, leto, umrljivost, rodnost, naravni prirast
* tabela 3: regija, leto, naravni prirast, selitveni prirast s tujino, selitveni prirast med stat. regijami, skupni prirast, skupni prirast na 1000 prebivalcev
* tabela 4: regija, leto, starostna skupina
* tabela 5: regija, gostota poseljenosti, število prebivalstva

#### Viri:

* tabela 1-4: [SURS](https://pxweb.stat.si/pxweb/Database/Dem_soc/Dem_soc.asp)
* tabela 5: [Wikipedija](https://sl.wikipedia.org/wiki/Statistične_regije_Slovenije)

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
