#Script para descargar los datos de los autores del Museo Nacional Centro de Arte Reina Sofía

library(rvest)
library(tidyverse)
library(readxl)

#Generamos el listado de las URLs
# url_base <-"https://www.museoreinasofia.es/autores/"
# urls_mncars <- paste0(url_base, LETTERS)
# 
# #Obtenemos los nombres
# obtener_nombres <- function(url){
#   x_path <-"/html/body/section/div/div/section/ul/li[*]/div/span/h3/a"
#   url %>%
#     as.character() %>%
#     read_html() %>%
#     html_nodes(xpath = x_path) %>%
#     html_text()
# }
# 
# autorxs <- sapply(urls_mncars,obtener_nombres)
# 
# #Guardamos la variable para no volver a hacer la solicitud
# save(autorxs ,file = "autorxs.RData")

load("autorxs.RData")

#Construimos el dataframe
df <- autorxs %>%
  unlist()%>%
  enframe(value = "autorxs")


#Separamos en nombre y apellido
df <- df %>%
  mutate(copia = autorxs) %>%
  separate(copia, into = c("apellidos","nombres"), sep = ",")
