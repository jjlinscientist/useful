#' Recycle brewer.pal() palette colors
#'
#' Wrapper around brewer.pal from RColorBrewer to reuse colors
#' @param n number of colors to pass to brewer.pal()
#' @param name name of color palette to extract colors from
#' @export
#' @examples
#' ecobrewer.pal(34, "Set1")

ecobrewer.pal <- function(n,
			  name)
{
	max <- length(suppressWarnings(brewer.pal(n, name)))
	if(n > max)
	{
		palette <- rep(suppressWarnings(brewer.pal(n, name)),
			       ceiling(n / max))
		palette <- palette[c(1:n)]
		warning(paste0("n is greater than the colors in ",
			       name,
			       ". Recycling colors..."))
	} else {
		palette <- brewer.pal(n, name)
	}
	return(palette)
}
