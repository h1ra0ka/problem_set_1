main <- function(){
  build()
  analyze()
  report()
}

build <- function(){
  source(here::here('03_build', 'inequality_tidy', 'code', 'build.R'))
  source(here::here('03_build', 'gdp_tidy', 'code', 'build.R'))
  source(here::here('03_build', 'gdp_ready', 'code', 'build.R'))
  source(here::here('03_build', 'master', 'code', 'build.R'))
}

analyze <- function(){
  source(here::here('04_analyze', 'summary', 'code', 'analyze.R'))
}

report <- function(){
  rmarkdown::render(input = here::here('05_report', 'code', 'report.Rmd'),
                    output_file = here::here('05_report', 'output', 'report.html'))
}

main()
