
 
"""rasgele_ornek2 <- sample(Billionaires,1000,replace = TRUE)
write.csv(Billionaires[rasgele_ornek2, ], file = "rasgele_ornek2.csv", row.names = FALSE)"""

"""rasgele_ornek2 <- sample(seq_len(nrow(Billionaires)), 1000, replace = TRUE) 
rasgele_ornek2_data <- Billionaires[rasgele_ornek2, ]
write.csv(rasgele_ornek2_data, file = "rasgele_ornek2.csv", row.names = FALSE)"""

okunan_veri2 <- read.csv("rasgele_ornek2.csv")
df <- as.data.frame(veri_final)

attach(df)

summary(df)
##########################################################################
"4.1.Servet dağılım analizi"
install.packages("dplyr")
library(dplyr)

#
sektor_dagilim <- table(industries)
print(sektor_dagilim)


sektor_say <- df %>%
  group_by(industries) %>%
  summarise(person_count = n())

top_sektorler <- sektor_say %>%
  arrange(desc(person_count)) %>%
  head(5)

print(top_sektorler)


#
ulke_dagilimi<- table(country)
print(ulke_dagilimi)


ulke_say <- df %>%
  group_by(country) %>%
  summarise(person_count = n())

top_ulke <- ulke_say %>%
  arrange(desc(person_count)) %>%
  head(5)

print(top_ulke)
#

bolge_dagilimi <-table(city)
print(bolge_dagilimi)


sehir_say <- df %>%
  filter(!is.na(city)) %>%
  group_by(city) %>%
  summarise(person_count = n())


en_cok_sehir <- sehir_say %>%
  arrange(desc(person_count)) %>%
  head(5)

print(en_cok_sehir)


install.packages("ggplot2")
library(ggplot2)
ggplot(veri_final, aes(x = as.factor(industries), y = log(finalWorth))) + geom_boxplot(fill = "purple")+xlab("industries")
theme_bw()+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

ggplot(veri_final, aes(x = as.factor(country), y = log(finalWorth))) + geom_boxplot(fill = "pink")+xlab("country")
theme_bw()+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
  
veri_final$city <- iconv(veri_final$city, from = "UTF-8", to = "ASCII//TRANSLIT")

ggplot(veri_final, aes(x = as.factor(city), y = log(finalWorth))) + geom_boxplot(fill = "red") + xlab("city") + theme(axis.text.x = element_text(angle = 45, hjust = 1))
theme_bw()+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))


##########################################################################
"4.2. Demografik Analiz"

install.packages("ggplot2")
library(ggplot2)

# Yaş dağılımını gösteren bir histogram
ggplot(df, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "pink", color = "purple") +
  labs(title = "Milyarderlerin Yaş Dağılımı")

summary(df$age)


install.packages("dplyr")
library(dplyr)

# Cinsiyet dağılımını analiz etme
cinsiyet_dagilimi <- df %>% 
  group_by(gender) %>% 
  summarise(count = n())

# Cinsiyet dağılımını gösteren bir çubuk grafik
custom_colors2 <- c("#FFFF00", "#90EE90")

ggplot(cinsiyet_dagilimi, aes(x = gender, y = count, fill = gender)) +
  geom_bar(stat = "identity") +
  labs(title = "Milyarderlerin Cinsiyet Dağılımı")+ scale_fill_manual(values = custom_colors2)


kadın_sayısı <- sum(df$gender == "F", na.rm = TRUE)
erkek_sayısı <- sum(df$gender == "M", na.rm = TRUE)


print(paste("Kadın Sayısı:", kadın_sayısı))
print(paste("Erkek Sayısı:", erkek_sayısı))


ggplot(df, aes(x = countryOfCitizenship, fill = countryOfCitizenship)) +
  geom_bar(stat = "count", data = df[!is.na(df$countryOfCitizenship), ]) +
  labs(title = "Milyarderlerin Doğum Yeri Dağılımı") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


dogum_yeri <- table(df$countryOfCitizenship)
print(dogum_yeri)

##########################################################################
"4.3:Kendi kendine yapılan ve miras alınan zenginlik"

kendi_kendine_milyarder <- df[df$selfMade=="TRUE",]
miras_alan <- df[df$selfMade=="FALSE",]


yuzdelik<- nrow(kendi_kendine_milyarder)/nrow(df)*100

yuzdelik2 <- nrow(miras_alan)/nrow(df)*100

install.packages("ggplot2")
library(ggplot2)
df_pie <- data.frame(category = c("Kendi Kendine Milyarderler", "Miras Alanlar"),percentage = c(yuzdelik, yuzdelik2))
df_pie

custom_colors <- c("#ff69b4", "#800080")
ggplot(df_pie, aes(x = "", y = percentage, fill = category)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y") +
  scale_fill_manual(values = custom_colors) +
  theme_void() +
  labs(title = "Kendi Kendine Milyarder vs. Miras Alan Milyarder Yüzdelik Dağılımı")

###############################################
"4.4 Ekonomik göstergeler"

cor(df$finalWorth,is.na(df$cpi_country))

cor(df$finalWorth,is.na(df$gdp_country))

cor(df$finalWorth,is.na(df$total_tax_rate_country))

model <- lm(cpi_country ~ finalWorth, data = df)
plot(df$finalWorth, df$cpi_country, main = "finalWorth vs cpi_country", 
     xlab = "finalWorth", ylab = "cpi_country", pch = 19, col = "orange")
abline(model, col = "red", lwd = 2)


model2 <- lm(gdp_country ~ finalWorth, data = df)
plot(df$finalWorth, df$gdp_country, main = "finalWorth vs gdp_country", 
     xlab = "finalWorth", ylab = "gdp_country", pch = 19, col = "yellow")
abline(model2, col = "green", lwd = 2)


model3 <- lm(total_tax_rate_country ~ finalWorth, data = df)
plot(df$finalWorth, df$total_tax_rate_country, main = "finalWorth vs total_tax_rate_country", 
     xlab = "finalWorth", ylab = "total_tax_rate_country", pch = 19, col = "pink")
abline(model3, col = "purple", lwd = 2)

###############################################
"4.5 Mekansal analiz:"
install.packages("raster")
install.packages("sp")
install.packages("leaflet")
library(raster)
library(sp)
library(leaflet)


df$personName <- iconv(df$personName, to = "UTF-8", sub = "")

df <- na.omit(df[, c("latitude_country", "longitude_country", "personName", "finalWorth")])
df$personName <- iconv(df$personName, to = "ASCII//TRANSLIT")

install.packages("tmap")
library(tmap)

df <- df[complete.cases(df[c("latitude_country", "longitude_country")]), ]

tm_shape(df) +
  tm_bubbles(col = "red", size = "finalWorth", title.size = "Servet (milyar $)", alpha = 0.7) +
  tm_basemap(server = "OpenStreetMap") +
  tm_layout(title = "Milyarderlerin Coğrafi Dağılımı ve Servetleri")

install.packages("leaflet.extras")
library(leaflet.extras)
map <- leaflet(df) %>%
  addTiles() %>%
  addHeatmap(
    data = df,
    lat = ~latitude_country,
    lng = ~longitude_country,
    intensity = ~finalWorth,
    blur = 20
  ) %>%
  setView(lng = mean(df$longitude), lat = mean(df$latitude), zoom = 2)

map

install.packages("webshot")
library(webshot)
install.packages("htmlwidgets")
library(htmlwidgets)

saveWidget(map, file = "harita.html", selfcontained = TRUE)
webshot("harita.html", "harita.jpg", delay = 5)
webshot::install_phantomjs(force = TRUE)

library(leaflet)

map <- leaflet(df) %>%
  addTiles()


map <- map %>%
  addCircleMarkers(
    ~longitude_country, ~latitude_country,
    radius = ~sqrt(finalWorth) * 2,  
    fillOpacity = 0.7,
    color = "red",
    popup = ~paste("Servet: $", finalWorth / 1e9, "B"),
    clusterOptions = markerClusterOptions()  
  )


map
saveWidget(map, file = "harita2.html", selfcontained = TRUE)
webshot("harita2.html", "harita2.jpg", delay = 5)
webshot::install_phantomjs(force = TRUE)



install.packages("ggplot2") 
install.packages("tidyverse")
install.packages("dplyr")
library(ggplot2)
library(tidyverse)
library(dplyr)
install.packages("maps")
library(maps)



mapdata <- left_join(mapdata, df, by = c("region" = "country"))


ortalama_servet <- mean(mapdata$finalWorth, na.rm = TRUE)
mapdata$finalWorth[is.na(mapdata$finalWorth)] <- ortalama_servet


mapdata <- mapdata %>% 
  filter(!is.na(finalWorth)) %>%
  mutate(toplam_zenginlik = log(finalWorth))

map <- ggplot(mapdata, aes(x = long, y = lat, group = group)) +
  geom_polygon(aes(fill = toplam_zenginlik), color = "black", size = 0.5) +
  scale_fill_gradient(name = "Logaritmik Milyarder Serveti", low = "yellow", high = "red", na.value = "grey50") +
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.y = element_blank(),
    axis.title.x = element_blank(),
    rect = element_blank()
  )


print(map)


##########################################################
"4.6 Zaman içindeki eğilimler"

install.packages("ggplot2")
library(ggplot2)

birthDate
ggplot(df, aes(x = birthDate, y = finalWorth)) + 
  geom_smooth(span = 0.75, method = "loess" , colour = "orange" , size= 1.5) + 
  theme_bw() +
  theme(axis.text.x = element_text(angle = 60, hjust = 1)) + 
  labs(title = "Doğum Yıllarındaki Gelir ile 2022 Yılındaki Gelir Değişim Grafiği", y = "Gelir", x = "Milyarder") +
  scale_y_continuous(labels = scales::dollar_format(scale = 1e-3, suffix = 'K')) +
  scale_color_manual(values = c("Doğum Yılındaki Gelir" = "black"))
########################################################################
summary(df$gross_tertiary_education_enrollment)
summary(df$gross_primary_education_enrollment_country)