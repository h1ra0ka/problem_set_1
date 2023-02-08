main <- function(){
  gdp_tidy <- read_tidy()
  gdppc <- add_gdppc(gdp_tidy)
  save_data(gdppc)
}

read_tidy <- function(){
  gdp_tidy <- readr::read_rds(here::here("03_build", "gdp_tidy", "output","gdp_tidy.rds"))
  return(gdp_tidy)
}

add_gdppc <- function(gdp_tidy){
  gdppc <- dplyr::mutate(gdp_tidy, gdppc = GDP / population)
  return(gdppc)
}

save_data <- function(gdppc){
  saveRDS(gdppc, file = here::here("03_build", "gdp_ready", "output", "gdp_ready.rds"))
}

main()

#test <- readRDS(here::here("03_build", "gdp_ready", "output", "gdp_ready.rds"))
