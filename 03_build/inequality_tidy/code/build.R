main <- function(){
  inequality_skipped <- read_rawdata()
  inequality_long <- make_long(inequality_skipped)
  inequality_numeric <- arrange_type(inequality_long)
  save_data(inequality_numeric)
}

read_rawdata <- function(){
  inequality_skipped <- readxl::read_xlsx(here::here("02_raw", "inequality", "data", "Gini.xlsx"), col_names = FALSE, skip = 1)
  return(inequality_skipped)
}

make_long <- function(inequality_skipped){
  inequality_long <- t(inequality_skipped) %>% as.data.frame()
  colnames(inequality_long) <- c("country", "year", "gini")
  inequality_long <- inequality_long[-1, ]
  return(inequality_long)
}

arrange_type <- function(inequality_long){
  inequality_numeric <- inequality_long
  inequality_numeric["gini"] <- lapply(inequality_numeric["gini"], gsub, pattern="missing", replacement = NA)
  ix<-2:3
  inequality_numeric[ix]<-lapply(inequality_numeric[ix],as.numeric)
  return(inequality_numeric)
}

save_data <- function(inequality_numeric){
  saveRDS(inequality_numeric, file = here::here("03_build", "inequality_tidy", "output", "inequality_tidy.obj"))
}

main()