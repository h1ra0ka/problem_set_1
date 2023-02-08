main <- function(){
  master_data <- read_master()
  JPN_data <- read_JPN(master_data)
  USA_data <- read_USA(master_data)
  JPN_result <- JPN_regression(JPN_data)
  USA_result <- USA_regression(USA_data)
}

read_master <- function(){
  master_data <- readRDS(here::here("03_build", "master", "output", "master.rds"))
  return(master_data)
}

read_JPN <- function(master_data){
  JPN_data <- dplyr::filter(master_data, country == "JPN") %>%
    dplyr::select(year, gini)
  return(JPN_data)
}

read_USA <- function(master_data){
  USA_data <- dplyr::filter(master_data, country == "USA") %>%
    dplyr::select(year, gini)
  return(USA_data)
}

JPN_regression <- function(JPN_data){
  JPN_res <- lm(JPN_data$gini ~ I((JPN_data$year)^2) + JPN_data$year)
  JPN_reg <- summary(JPN_res)
}
