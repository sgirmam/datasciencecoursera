complete <- function(directory, id=1:332){									
  directory <- file.path(getwd())
  poll_files <- list.files(directory, full.names=TRUE)  
  nobs_matrix <- matrix (nrow = 0, ncol = 2) 								  
  nobs_df<- data.frame(nobs_matrix)                           				
  for (i in id) {                      
	  file_i <-read.csv(poll_files[i])
	  nobs <- nrow(na.omit(file_i))
	  nobs_lst <- data.frame(i, nobs)
	  nobs_df <- rbind(nobs_df, nobs_lst)  	  
		}  
  colnames(nobs_df) <- c("id", "nobs")
return(nobs_df)
}

