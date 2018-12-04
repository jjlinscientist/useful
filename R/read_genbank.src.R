#' genbank batch Biostrings
#'
#' extract DNAStringSet data from batch of genbank files: requires package Biostrings
#' @param files path or list of paths to genbank files
#' @param output_list logical argument to concatenate list of XStringSets - default is FALSE
#' @export
#' @examples
#' random_DNA(files = c("path/to/example1.gb", "path/to/example2.gb"), output_list = FALSE)

read_genbank <- function(files)
{
	sequences <- lapply(files,
			    function(file)
			    {
				    lines <- readLines(file)
				    origin <- grep("^ORIGIN", lines) + 1
				    stop <- grep("^//", lines) - 1
				    sequence <- lines[origin:stop]
				    sequence <- gsub("[0-9]", "", sequence)
				    sequence <- gsub(" ", "", sequence)
				    sequence <- paste(sequence, collapse = "")
				    if(grepl("t|T", sequence) && !grepl("u|U", sequence))
				    {
					    string <- DNAString(sequence)
				    }
				    else if(grepl("u|U", sequence) && !grepl("t|T", sequence))
				    {
					    string <- RNAString(sequence)
				    }
				    else
				    {
					    stop("Cannot mix T and U in the same sequence")
				    }
				    sequence <- DNAStringSet(string)
				    return(sequence)
			    })
	if(output_list)
	{
		sequences <- do.call(c, sequences)
	}
	return(sequences)
}
