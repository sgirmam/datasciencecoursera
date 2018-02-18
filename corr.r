corr <- function(directory, threshold = 0) {
        directory <- file.path(getwd())
		poll_files <- list.files(directory, full.names = TRUE)
        dat <- vector(mode = "numeric", length = 0)        
        for (i in 1:length(poll_files)) {
                files_i <- read.csv(poll_files[i])
                nobs <- sum((!is.na(files_i$sulfate)) & (!is.na(files_i$nitrate)))
                if (nobs > threshold) {
                        s_obs <- files_i[which(!is.na(files_i$sulfate)), ]
                        ns_obs <- s_obs[which(!is.na(s_obs$nitrate)), ]
                        dat <- c(dat, cor(ns_obs$sulfate, ns_obs$nitrate))
                }
        }       
        dat
}

