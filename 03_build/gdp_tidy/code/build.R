main <- function(){
  gdp_japan <- read_japan()
  gdp_us <- read_us()
  gdp_tidy <- bind_dataframe(gdp_japan, gdp_us)
  save_data(gdp_tidy)
}

read_japan <- function(){
  gdp_japan <- readr::read_csv(here::here("02_raw", "gdp", "data", "Japan.csv"))
  gdp_japan$country <- c(rep("JPN", nrow(gdp_japan)))
  return(gdp_japan)
}

read_us <- function(){
  gdp_us <- readr::read_csv(here::here("02_raw", "gdp", "data", "United States.csv"))
  gdp_us$country <- c(rep("USA", nrow(gdp_us)))
  return(gdp_us)
}

bind_dataframe <- function(gdp_japan, gdp_us){
  gdp_tidy <- rbind(gdp_japan, gdp_us)
  return(gdp_tidy)
}

save_data <- function(gdp_tidy){
  saveRDS(gdp_tidy, file = here::here("03_build", "gdp_tidy", "output", "gdp_tidy.rds"))
}

main()

#test <- readRDS(here::here("03_build", "gdp_tidy", "output", "gdp_tidy.rds"))