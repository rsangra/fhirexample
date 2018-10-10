#' Fhir browse locations
#'
#' This function returns all the centres
#' @param state State
#' @param suburb Suburb
#' @export
#' @examples
#' locations(state ="NSW,suburb="sydney")

locations <- function(state,suburb){
  Sys.setenv(mongourl="mongourl://xxxx.com")
  return(paste("You searched for",state, suburb , Sys.getenv("mongourl")))
}
