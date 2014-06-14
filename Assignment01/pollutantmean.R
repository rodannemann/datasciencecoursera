pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    
    all_files <- list.files("specdata","*.csv")
    subject_files <- paste("specdata", all_files[id], sep="\\")
    monitor_data <- lapply(subject_files, read.csv)
    for (monitor in monitor_data){
        
        # if the merged dataset doesn't exist, create it
        if (!exists("subject_data")){
            subject_data <- monitor
        }    
        # if the merged dataset does exist, append to it
        else {
            subject_data <- rbind(subject_data, monitor)
        }
    }
    mean(na.omit(subject_data[[pollutant]]))
}