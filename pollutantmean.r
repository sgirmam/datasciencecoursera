pollutantmean <- function(directory, pollutant, id=1:332){						
	  ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
	directory <- file.path(getwd())
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
	
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
	poll_files <- list.files(directory, pattern = ".csv", full.names=TRUE)  	
	poll_matrix <- matrix (nrow = 0, ncol = 4) 									
	dimnames(poll_matrix) <- list (NULL, c("Date", "sulfate", "nitrate", "ID")) 		
	poll_df <- data.frame(poll_matrix)                           				
	for (i in id) {                       
	  file_i <-read.csv(poll_files[i])
	  poll_df <- rbind(poll_df, file_i)  
		}
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  #nmean <- mean(poll_df[, pollutant], na.rm = TRUE)
  nmean <- mean(poll_df[[paste0(pollutant)]], na.rm = T) 
return(nmean)
}