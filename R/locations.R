#' Fhir browse locations
#'
#' This function returns all the centres
#' @param state State
#' @param suburb Suburb
#' @export
#' @examples
#' locations(state ="NSW,suburb="sydney")

locations <- function(mongoUrl, mDb, mCollection){
  m <- mongolite::mongo(collection = mCollection,db =mDb, url = mongoUrl)
  activeLocations <- m$find(
    query = '{"resourceType" : "Location" , "@state" : "current" }',
    fields = '{"name" : true, "status" : true, "address.state" : true , "address.country" : true ,"_id": false}',
    limit = 200
  )
  return(activeLocations)
}
