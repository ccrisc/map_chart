
library("tidyverse")
library("leaflet")
customers <- read.csv("customers.csv", sep=";")
customers$lat <- as.numeric(sub(",", ".", customers$POSLAT, fixed = TRUE))
customers$long <- as.numeric(sub(",", ".", customers$POSLNG, fixed = TRUE))
customers %>%
  leaflet() %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>%
  addLayersControl(baseGroups = c("Toner Lite", "World Imagery")) %>%
  addMarkers(label = customers$ALIAS,
             clusterOptions = markerClusterOptions()) %>%
  setView(lat = 37.500000, lng = 15.090278, zoom = 7)



#example complex df

flattened_data$latitude <- as.numeric(flattened_data$latitude)
flattened_data$longitude <- as.numeric(flattened_data$longitude)

flattened_data %>% 
  select(visitorId, latitude, longitude) %>%
  drop_na(latitude, longitude) %>%
  distinct(visitorId, .keep_all = TRUE) %>%
  leaflet() %>%
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>%
  addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite") %>%
  addLayersControl(baseGroups = c("Toner Lite", "World Imagery")) %>%
  addMarkers(label = unique(flattened_data$visitorId),
             clusterOptions = markerClusterOptions()) %>%
  setView(lat = 37.500000, lng = 15.090278, zoom = 7)