% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{maintenance_report}
\alias{maintenance_report}
\title{Maintenance Report}
\usage{
maintenance_report(maintenance_history, due_every,
  current_mileage = NULL)
}
\arguments{
\item{maintenance_history}{current maintenance history dataframe. Package provides and example format}

\item{due_every}{the due_every dataframe. Package provides an example format.}

\item{current_mileage}{current mileage of truck}
}
\value{
A dataframe with items and the next mileage at which maintenance is
due. Ordered so that next set of maintenance needs appear first.
If `current_mileage` is provided, a column `due_in` will be provided which
is the number of miles before the maintenance is due.
}
\description{
Takes current history and provides a mileage due report showing the items
up for maintenance in order according to mileage
}
