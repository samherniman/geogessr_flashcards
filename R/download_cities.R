
download_cities <- function(country_name = NULL, min_pop = 10000, top_num = 100) {
  cities <- ne_download(
    scale = "large", 
    returnclass = "sf", 
    category = 'cultural', 
    type = 'populated_places'
    ) %>% 
  filter(SOV0NAME == country_name) %>%
  filter(POP_MIN >= min_pop) %>% 
  top_n(top_num, wt = POP_MAX)
cities$geometry <- NULL

cities_points <- 
  st_as_sf(
    cities, 
    coords = c("LONGITUDE", "LATITUDE"), 
    crs = 4326, 
    agr = "constant"
    )
}

# download locations of all cities with more than 10000 people in NL

