coordenadas<-c(43.666302, -79.416626)

encontrar<-function(lugar,radius,types,keyword){
  
  # radius in meters
  #lugar is coordinates from google maps by hand
  coor<-paste(lugar[1],lugar[2],sep=",")
  baseurl<-"https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
  google_key<-c("AIzaSyBRua5hFBwhdK8ijTOcJJDFHNtzq9gLuD4")
  
  
  q<-paste(baseurl,"location=",coor,"&radius=",radius,"&types=",types,"&keyword=",keyword,"&key=",google_key, sep="")
  
  print(q)
  
  data1<-fromJSON(q)
  
  lat_long<-data.frame(lat=data1$results$geometry$location$lat,long=data1$results$geometry$location$lng)
  
  sitios<-data1$results$name
  
  #print(data1)
  
  df<-cbind(sitios,lat_long)
  return(df)
  
  #return()
}

encontrar(lugar = coordenadas,radius = 500,"pizzeria","food|restaurant")
