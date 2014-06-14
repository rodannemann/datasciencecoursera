corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    all_files <- list.files(directory,"*.csv")
    subject_files <- paste(directory, all_files, sep="\\")
    monitor_data <- lapply(subject_files, read.csv)
    v_cor <- vector(mode="numeric",length=0)
    for (monitor in monitor_data) 
    {
        valid_obs <- complete.cases(monitor)
        if (sum(valid_obs) >= threshold) {
            v_cor <- rbind(v_cor, cor(monitor[valid_obs,2],monitor[valid_obs,3]))
        }
    }
    return (v_cor)
}