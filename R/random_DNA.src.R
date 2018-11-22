#' random DNA sequence generator
#'
#' generate a random string of DNA (or RNA) bases
#' @param length length of DNA sequence to be generated
#' @param is_RNA defaults to FALSE
#' @param seed random seed; defaults to NULL
#' @export
#' @examples
#' random_DNA(12, is_RNA = TRUE, seed = 123)

random_DNA <- function(
		       length,
		       is_RNA = FALSE,
		       seed = NULL
		       )
{
	set.seed(seed)
	if(is_RNA)
	{
		bases <- c("A", "U", "C", "G")
	}
	else
	{
		bases <- c("A", "T", "C", "G")
	}
	indices <- sample(
	   		  seq(from = 1, to = 4),
		    	  size = length,
			  replace = TRUE
	       )
	sequence <- sapply(
			   indices,
			   function(index)
			   {
				   bases[[index]]
			   }
			   )
	paste0(sequence, collapse = "")
}
