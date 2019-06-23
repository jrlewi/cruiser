#' Find max milage
#'
#' functions takes current maintenance history for a single item
#' and finds the last mileage maintenance was done (i.e. max mileage)
#'
#' @param drfr a data frame containing history for one maintenance item
#' @return dataframe containing the item and last mileage maintenace was done
#' (mileage_done)
find_max_mileage <- function(dtfr){
  dtfr %>%
    arrange(desc(mileage_done)) %>%
    .[1,]
}


#' Maintenance Report
#'
#' Takes current history and provides a mileage due report showing the items
#' up for maintenance in order according to mileage
#'
#' @param maintenance_history current maintenance history dataframe. Package provides and example format
#' @param due_every the due_every dataframe. Package provides an example format.
#' @param current_mileage current mileage of truck
#' @return  A dataframe with items and the next mileage at which maintenance is
#' due. Ordered so that next set of maintenance needs appear first.
#' If `current_mileage` is provided, a column `due_in` will be provided which
#' is the number of miles before the maintenance is due.
#' @import dplyr
#' @importFrom  magrittr %>%
#' @importFrom  purrr map
#' @export
maintenance_report <- function(maintenance_history, due_every,
                               current_mileage = NULL){
  #Find the max Mileage and add the recommended mileage ----
  items <- unique(maintenance_history$Item)
  last_maintenance <- items %>%  map(function(itm){
    maintenance_history %>%
      filter(Item == itm) %>%
      find_max_mileage()
  }) %>% bind_rows()

  due <- last_maintenance %>%
    full_join(due_every, by = "Item") %>%
    mutate(due = mileage_done + due_every) %>%
    select(-due_every) %>%
    arrange(due)
  if(!is.null(current_mileage)){
    due <- due %>%
      mutate(due_in = due - current_mileage)
  }
  due %>%
    select(-one_of("notes"), one_of("notes"))
}
