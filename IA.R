install.packages('tidyverse')
library(tidyverse)

worldmap <- map_data('world')
ggplot()+
  geom_polygon(map_data('world'), mapping = aes(x=long, y=lat, group=group))

europetarget <- c("UK", "Albania", "Andorra", "Armenia", "Austria", "Azerbaijan", "Belarus", "Belgium", "Bosnia and Herzegovina", "Bulgaria", "Croatia", "Cyprus", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Georgia", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Kazakhstan", "Kosovo", "Latvia", "Liechenstein", "Lithuania", "Luxembourg", "Macedonia", "Malta", "Moldova", "Monaco", "Montenegro", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russia", "San Marino", "Serbia", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Ukraine", "Vatican City")
randommap <- worldmap %>%
  filter(region %in% europetarget)

filteredmap <- randommap %>%
  filter(long < 60) %>% 
  filter(lat < 75)

filtereddata <- conf_europe2 %>%
  filter(longitude < 60) %>%
  filter(latitude < 75)

ggplot() +
  geom_polygon(data=filteredmap, mapping = aes(x=long, y=lat, group=group, fill=region), colour='black') +
  scale_fill_hue(c=45, l=80) +
  guides(fill=FALSE) +
  theme_minimal() +
  geom_point(data=filtereddata, mapping=aes(x=longitude, y=latitude, size=best), colour="red", alpha=0.25) +
  labs(title = "Conflict Map of Europe", x = "Longitude", y = "Latitude", = "Estimated \nnumber of \ncasualties")

ggplot() +
  geom_polygon(data=randommap, mapping=aes(x=long, y=lat, group=group)) +
  geom_point(data=conf_europe2, mapping=aes(x=longitude, y=latitude))

ggplot() +
  geom_polygon(data=filteredmap, mapping = aes(x=long, y=lat, group=group, fill=region), colour='black') +
  scale_fill_hue(c=45, l=80) +
  guides(fill=FALSE) +
  theme_minimal() +
  geom_point(data=filtereddata, mapping=aes(x=longitude, y=latitude), colour="red", alpha=0.25) +
  labs(title = "Conflict Map of Europe from 1989 to 2015", x = "Longitude", y = "Latitude")

filteryeardatapost <- filtereddata %>%
  filter(year >= 2000) 

ggplot() +
  geom_polygon(data=filteredmap, mapping = aes(x=long, y=lat, group=group, fill=region), colour='black') +
  scale_fill_hue(c=45, l=80) +
  guides(fill=FALSE) +
  theme_minimal() +
  geom_point(data=filteryeardatapost, mapping=aes(x=longitude, y=latitude), colour="red", alpha=0.25) +
  labs(title = "Conflict Map of Europe from 2000 to 2015", x= "Longitude", y = "Latitude")

filteryeardatapre <- filtereddata %>%
  filter(year< 2000)

ggplot() +
  geom_polygon(data=filteredmap, mapping = aes(x=long, y=lat, group=group, fill=region), colour='black') +
  scale_fill_hue(c=45, l=80) +
  guides(fill=FALSE) +
  theme_minimal() +
  geom_point(data=filteryeardatapre, mapping=aes(x=longitude, y=latitude), colour="red", alpha=0.25) +
  labs(title = "Conflict Map of Europe from 1989 to 2000", x= "Longitude", y = "Latitude")

summary(conf_europe2$year)
