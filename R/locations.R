#' Fhir browse locations
#'
#' This function returns all the centres
#' @param state State
#' @param suburb Suburb
#' @export
#' @examples
#' locations(state ="NSW,suburb="sydney")

locations <- function(state,suburb){
  m <- mongolite::mongo(collection = Sys.getenv("mcollection"),db =Sys.getenv("mdb"), url = Sys.getenv("mongourl"))
  activeLocations <- m$find(
    query = '{"resourceType" : "Location" , "@state" : "current" }',
    fields = '{"name" : true, "status" : true, "address.state" : true , "address.country" : true ,"_id": false}',
    limit = 200
  )
  return(activeLocations)
}
