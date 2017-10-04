library(RCurl)
library(ggmap)
library(jsonlite)
library(ggmap)
library(ggplot2)


# example: postal = "M4G 4G9" radius = 5 (km), keyword = "pizzeria", type = "food|restaurant"

findCompetitors <- function(postal, raio, palabra_clave, tipo){
  lugar <- geocode(postal)
  
  dados <- encontrar(postal, radius = raio, loja, tipo)
  
  generate_map(dados, coordenadas)
}

#coordenadas<-c(43.666302, -79.416626)



encontrar<-function(lugar,radius,keyword, types){
  #convert zip code to google coordenadas
  
  
  # radius in km
  radius<-radius*1000
  #lugar is coordinates from google maps by hand
  coor<-paste(lugar[1],lugar[2],sep=",")
  baseurl<-"https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
  google_key<-c("AIzaSyBRua5hFBwhdK8ijTOcJJDFHNtzq9gLuD4")
  
  
  q<-paste(baseurl,"location=",coor,"&radius=",radius,"&types=",types,"&keyword=",keyword,"&key=",google_key, sep="")
  
  print(q)
  
  data1<-fromJSON(URLencode(q))
  
  lat_long<-data.frame(lat=data1$results$geometry$location$lat,long=data1$results$geometry$location$lng)
  
  sitios<-data1$results$name
  
  direccion<-data1$results$vicinity

  df<-cbind(lat_long,sitios, direccion)
  
  return(df)
}

generate_map <- function(dados, coordenadas){
  la_senal <-data.frame(long=dados$long,lat=dados$lat)
  map <- get_googlemap(center = c(coordenadas[2],coordenadas[1]),zoom=13, maptype = "roadmap",markers = la_senal,source="google")
  ggmap(map)
}


# M4G 4G9
coordenadas<-c(43.712463, -79.363390) #EGLINTON & LAIRD, ON | 825 Eglinton Avenue East Toronto, ON

encontrar(lugar = coordenadas,radius = 5,"car","")
encontrar(lugar = coordenadas,radius = 5,"car","car_repair")

encontrar(lugar = coordenadas,radius = 5,"service","")
encontrar(lugar = coordenadas,radius = 5,"service","car_repair")

encontrar(lugar = coordenadas,radius = 5,"automotive","")
dados <- encontrar(lugar = coordenadas,radius = 5,"automotive","car_repair")

encontrar(lugar = coordenadas,radius = 5,"auto","")
encontrar(lugar = coordenadas,radius = 5,"auto","car_repair")

generate_map(dados, coordenadas)

#map <- get_map(location = c(lon = coordenadas[2], lat = coordenadas[1]), zoom = 18, maptype = "roadmap", source = "google")
#map <- get_googlemap(center = c(-79.363390,43.712463),zoom=13, maptype = "roadmap",markers = dados,source="google")
# 18 about 1 block
#ggmap(map)
# todo: add markers
#dados<-data.frame(long=data$long,lat=data$lat)

generate_map(dados, coordenadas)