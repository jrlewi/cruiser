#can use this file to update the maintenace history dataset with new mileages.

library(tidyverse)
## History-----
oil <- tibble(Item = 'Oil Change + Grease Driveline',
              mileage = c(159063, 163500))

t_case <- tibble(Item = 'T-case',
                 mileage = c(165600))

diff_fluid <- tibble(Item = 'Diff Fluid Front & Rear',
                     mileage = c(165600))

power_steer <- tibble(Item = 'Power Steering',
                      mileage = c(159063))

break_fluid <- tibble(Item = 'Break Fluid',
                      mileage = c(159063))

AHC <- tibble(Item = "AHC (Adjustable Hydraulic Height)",
              mileage = 159063)

trans <- tibble(Item = "Transmission",
                mileage = c(100000, 165600))

tires <- tibble(Item = 'Tires Put On',
                mileage = c(161448))

tire_rot <- tibble(Item = 'Tire Rotation',
                   mileage = c(161448, 166448))

air_filter <- tibble(Item = "Air Filter",
                     mileage = c(159063, 163000))

indoor_air_filter <- tibble(Item = "Indoor Air Filter",
                            mileage = c(159063, 163000))

brakes <- tibble(Item = c('Breaks', 'Wheel Bearings'),
                 mileage = c(96665, 165600))

heater_ts <- tibble(Item = c('Heater Ts',
                             'Spark Plugs',
                             'Timing Bel/Water Pump'),
                    mileage = c(159063, 120000, 90000))

# History ------
(maintenance_history <-
   dplyr::bind_rows(oil, power_steer, break_fluid,
                    AHC, trans, tires, tire_rot,
                    air_filter, indoor_air_filter,
                    brakes, heater_ts) %>%
   group_by(Item) %>%
   arrange(desc(mileage), .by_group = TRUE))

maintenance_history <- maintenance_history %>%
  rename(mileage_done = mileage)


save(maintenance_history, file = '../cruiser/data/maintenance_history.RData')

items <- unique(maintenance_history$Item)

due_every <- tibble(Item = items, due_every = c(60000,
                                                10000,
                                                30000,
                                                90000,
                                                30000,
                                                15000,
                                                10000,
                                                30000,
                                                100000,
                                                90000,
                                                5000,
                                                60000,
                                                10000,
                                                30000))

save(due_every, file = '../cruiser/data/due_every.RData')



## Create List of Next Maintence Items Due ----

# find_max_mileage <- function(dtfr){
#   dtfr %>%
#     arrange(desc(mileage_done)) %>%
#     .[1,]
# }
#
#
#
# maintenance_report <- function(maintenance_history,
#                                current_mileage = NULL){
#   #Find the max Mileage and add the recommended mileage ----
#   items <- unique(maintenance_history$Item)
#   last_maintenance <- items %>%  map(function(itm){
#     maintenance_history %>%
#       filter(Item == itm) %>%
#       find_max_mileage()
#   }) %>% bind_rows()
#
#   due <- last_maintenance %>%
#     full_join(due_every) %>%
#     mutate(due = mileage_done + due_every) %>%
#     select(-due_every) %>%
#     arrange(due)
#   if(!is.null(current_mileage)){
#     due %>%
#       mutate(due_in = due - current_mileage)
#   }
#   due
# }
#
# maintenance_report(maintenance_history)






