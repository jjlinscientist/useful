#' simple fasta file batch reader
#'
#' extract DNAStringSet data from a batch of fasta files - requires package Biostrings
#' @param files path or list of paths to fasta files
#' @param is_RNA logical argument to use RNAStringSet - default is FALSE
#' @param output_list logical argument to concatenate list of XStringSets - default is FALSE
#' @export
#' @examples
#' read_fasta(files = c("path/to/example1.fa", "path/to/example2.fa"), is_RNA = FALSE, output_list = FALSE)

read_fasta <- function(files,
		       is_RNA = FALSE,
		       output_list = FALSE)
{
	sequences <- lapply(files,
			    function(file)
			    {
				    if(is_RNA)
				    {
					    sequence <- readRNAStringSet(file)
				    }
				    else
				    {
					    sequence <- readDNAStringSet(file)
				    }
				    return(sequence)
			    })
	if(output_list)
	{
		sequences <- do.call(c, sequences)
	}
	return(sequences)
}
