#' load a list of libraries
#'
#' take a list of installed packages and load them all
#' @param library_list character list of packages to load
#' @export
#' @examples
#' load_library_list(c("data.table", "Biostrings"))
#' load_library_list(list_of_packages)

load_library_list <- function(library_list)
{
	lapply(
	       library_list,
	       function(library)
	       {
		       library(
			       library,
			       character.only = TRUE
			       )
	       }
	       )
}
