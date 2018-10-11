#' Mongo Client
#'
#' This function returns mongo client connected to configurated environment variables
#' mongoUrl, mDb, mCollection
#'
#' @export
#' @example
#' mongoconnect()

mongoConnect <- function(){
  m <- mongolite::mongo(collection = Sys.getenv("mCollection"),db =Sys.getenv("mDb"), url = Sys.getenv("mongoUrl"))
  return(m)
}
