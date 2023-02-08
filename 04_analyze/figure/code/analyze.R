main <- function(){
  master <- read_master()
  JPN <- get_JPN_ready(master)
  USA <- get_USA_ready(master)
  make_figures(JPN, USA)
}

read_master <- function(){
  master <- readRDS(here::here("03_build", "master", "output", "master.rds"))
  return(master)
}

get_JPN_ready <- function(master){
  JPN <- dplyr::filter(master, country == "JPN") %>%
    dplyr::select(year, gini)
  return(JPN)
}

get_USA_ready <- function(master){
  USA <- dplyr::filter(master, country == "USA") %>%
    dplyr::select(year, gini)
  return(USA)
}

make_figures <- function(JPN, USA){
  library(ggplot2)
  JPN_figure <- ggplot2::ggplot(data = JPN, aes(year, gini))
  JPN_figure <- JPN_figure + geom_point() + geom_line()
  ggsave(file = here::here("04_analyze", "figure", "output", "JPN_figure.png"), plot = JPN_figure)
  
  USA_figure <- ggplot2::ggplot(data = USA, aes(year, gini))
  USA_figure <- USA_figure + geom_point() + geom_line()
  ggsave(file = here::here("04_analyze", "figure", "output", "USA_figure.png"), plot = USA_figure)
}

main()