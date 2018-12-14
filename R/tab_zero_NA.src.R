#' data.table replace NAs
#'
#' replaces all NAs in a data.table with a set value
#' @param data either data.table or data.frame object
#' @param replacement value to replace NAs with
#' @param return_data.table logical argument for table type (defaults to TRUE)
#' @export
#' @examples
#' tab_zero_NA(table, replacement = "0", return_data.frame = TRUE)

tab_zero_NA <- function(data,
			replacement = 0,
			return_data.table = TRUE)
{
	data <- as.data.frame(table)
	data[is.na(data)] <- replacement
	if(return_data.table)
	{
		data <- as.data.table(data)
	}
	return(data)
}
