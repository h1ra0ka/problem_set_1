main <- function(){
  tidy_data <- read_data()
  filled_data <- fill_up(tidy_data)
  chosen_data <- choose_by_year(filled_data)
}

read_data <- function(){
  tidy_data <- readRDS(here::here("03_build", "inequality_tidy", "output", "inequality_tidy.obj"))
  return(tidy_data)
}

fill_up <- function(tidy_data){
  #imputeTS
}