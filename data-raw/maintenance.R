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
   dplyr::bind_rows(oil, t_case, diff_fluid,
                    power_steer, break_fluid,
                    AHC, trans, tires, tire_rot,
                    air_filter, indoor_air_filter,
                    brakes, heater_ts) %>%
   group_by(Item) %>%
   arrange(desc(mileage), .by_group = TRUE))

maintenance_history <- maintenance_history %>%
  rename(mileage_done = mileage) %>%
  mutate(mileage_done = round(mileage_done,-2))

maintenance_history  <- maintenance_history %>%
  mutate_if(is.numeric, as.integer)

save(maintenance_history, file = '../cruiser/data/maintenance_history.RData')

items <- unique(maintenance_history$Item)

due_every <- tibble(Item = items, due_every = c(60000,
                                                10000,
                                                30000,
                                                90000,
                                                30000,
                                                30000,
                                                15000,
                                                10000,
                                                30000,
                                                120000,
                                                30000,
                                                90000,
                                                5000,
                                                60000,
                                                10000,
                                                30000))

due_every <- due_every %>%
  mutate(notes = c(
    'AHS fluid  = ??',
    'Air Filter - order on amazon',
    'break fluid type = ??',
    'break types = ?',
    'gear oil 80W-90 Valvolene, rear - 3.3/2 Liters, front - 1.7 Liters',
    'order online, get part number',
    'Indoor Air Filter - order on amazon',
    'Oil - Mobil 1 Extend Performance 15,000 miles, Advanced fuel synthetic motor oil',
    'Power Steering fluid type = ??',
    'Type of spartk plugs?',
    'T-case fluid - same as front/rear diff?, 1.27 Liters',
    'Timing belt/Water Pump - get done at dealer?',
    'Tire Rotation: Spare -> Passenger Rear -> Passenger Front -> Driver Rear -> Driver Front -> Spare',
    'Tires Put on - BF Goodrich',
    'Transmission - 12 Quarts, Valvoline Max Life Full Synthetic. Multi Vehicle ATF Automatic Transmission Fluid (recommended for Toyota)',
    "Wheel Bearings - order online???"))



due_every <- due_every %>%
  mutate_if(is.numeric, as.integer)


save(due_every, file = '../cruiser/data/due_every.RData')



# ## Create List of Next Maintence Items Due ----
#
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
#     due <-  due %>%
#       mutate(due_in = due - current_mileage)
#   }
#   due %>%
#     select(-one_of('notes'), one_of('notes'))
# }
#
#
#
#
#
#
#
#
#
