#' Quick Quit Function
#'
#' Quickly quit without saving the R environment to disk.
#' @export
#' @examples
#' qq()

qq <- function()
{
	quit(save = "no",
	     status = 0,
	     runLast = TRUE)
}
