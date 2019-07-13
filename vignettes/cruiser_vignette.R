## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ---- dtframes, echo = TRUE----------------------------------------------
library(cruiser)
library(magrittr)
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

