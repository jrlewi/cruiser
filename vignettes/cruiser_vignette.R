## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ---- download, echo = TRUE, eval= FALSE---------------------------------
#  devtools::install_git('https://github.com/jrlewi/cruiser')

## ---- attach, echo = TRUE------------------------------------------------
library(cruiser)
library(magrittr)

## ---- dtframes, echo = TRUE----------------------------------------------
library(cruiser)

my_maint_history <- cruiser::maintenance_history
my_due_every <- cruiser::due_every
knitr::kable(my_maint_history %>% head()) 
knitr::kable(my_due_every %>%  head())

## ---- report, echo = TRUE------------------------------------------------
maintenance_report(my_maint_history, 
                            my_due_every, 
                            current_mileage = 169000) %>%
  head() %>% 
  knitr::kable()

