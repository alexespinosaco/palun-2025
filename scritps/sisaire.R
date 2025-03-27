if (!require("here")) install.packages("here"); library("here")
if (!require("tidyverse")) install.packages("tidyverse"); library("tidyverse")
if (!require("janitor")) install.packages("janitor"); library("janitor")

here::here()

raw_data_estaciones_pm10 <-
  readxl::read_excel(
    here::here(
      "datos",
      "sisaire_estaciones_pm10.xls"
    ),
    skip = 9
  )

estaciones_pm10 <-
  raw_data_estaciones_pm10 |>
  janitor::clean_names() |>
  dplyr::filter(
    fecha_ultimo_registro >= "2025-01-01 00:00"
  )

estaciones_amva_pm10 <-
  estaciones_pm10 |>
  dplyr::filter(
    svca == "SISAIRE - AMVA"
  )
