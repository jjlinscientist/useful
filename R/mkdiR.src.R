#' mkdir within R
#'
#' wraps around BASH mkdir using system2
#' @param dir directories to create
#' @param args additional arguments to pass to mkdir
#' @param ... additional arguments to pass to system2
#' @param parents logical, -p flag for mkdir: defaults to TRUE
#' @export
#' @examples
#' mkdir("output/csv/", args = "-V")

mkdir <- function(dir,
                  args = "",
                  ...,
                  parents = TRUE)
{
    if(parents) {
        args <- c("-p", args, dir)
    } else {
        args <- c(args, dir)
    }
    system2("mkdir",
            args = args,
            ...)
}
