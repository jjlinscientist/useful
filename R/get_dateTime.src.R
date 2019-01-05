#' Sys.time() wrapper parse
#'
#' Parses Sys.time() for a filename-friendly timestamp
#' @export
#' @examples
#' get_dateTime() 
#' [1] "2019-01-01_00:00:01"

get_dateTime <- function()
{
	dateTime <- Sys.time()
	dateTime <- gsub(" ", "_", dateTime)
	dateTime <- gsub("UTC", "", dateTime)
	return(dateTime)
}
