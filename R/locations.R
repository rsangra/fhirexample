#' Fhir browse locations
#'
#' This function returns all the centres
#' @param state State
#' @param suburb Suburb
#' @export
#' @examples
#' locations(state ="NSW,suburb="sydney")

locations <- function(state,suburb){
  cat(paste("You searched for",state, suburb))
}
