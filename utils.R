#!/usr/bin/env Rscript

options(scipen=10000)

# Install
paquetes <- c("ggplot2","tidyverse","plyr","scales",'knitr', 
              "kableExtra", "ggmap","sf","spdep", "mapproj",
              "rgdal", "leaflet")


no_instalados <- paquetes[!(paquetes %in% installed.packages()[,"Package"])]
if(length(no_instalados)) install.packages(no_instalados)
res <- lapply(paquetes, require, character.only = TRUE)
if(Reduce(res, f = sum)/length(paquetes) < 1) stop("Some packages could not be loaded.")

# Functions

# Metadata
names_iter <- c("cve_locc","nom_ent","nom_muni", "nom_loc","pobtot", "x_",
           "Población_de_15_años_o_más_analfabeta", 
           "Población_de_6_a_14_años_que_no_asiste_a_la_escuela", 
           "Población_de_15_años_y_más_con_educación_básica_incompleta",
           "Población_sin_derecho-habiencia_a_servicios_de_salud", 
           "Viviendas_con_piso_de_tierra", 
           "Viviendas_que_no_disponen_de_excusado_o_sanitario", 
           "Viviendas_que_no_disponen_de_agua_entubada_de_la_red_pública",
           "Viviendas_que_no_disponen_de_drenaje", 
           "Viviendas_que_no_disponen_de_energía_eléctrica", 
           "Viviendas_que_no_disponen_de_lavadora", 
           "Viviendas_que_no_disponen_de_refrigerador", "x_2",
           "indice_rezagosocial", "grado_rezago_social", "ranking_irz")