complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        all_files <- list.files(directory,"*.csv")
        subject_files <- paste(directory, all_files[id], sep="\\")
        monitor_data <- lapply(subject_files, read.csv)
        nobs <- vector(mode="integer",length(monitor_data))
        i <- 1
        for (m_file in monitor_data) 
        {
           nobs[i] = sum(complete.cases(m_file))
           i <- i + 1
        }
        data.frame(id,nobs)
}