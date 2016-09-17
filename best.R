best <- function(state, outcome){
        if(!dir.exists("./data")) dir.create("./data")
        if(!file.exists("data/outcome-of-care-measures.csv")){
                url <- "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
                temp <- tempfile()
                download.file(url, temp)
                unzip(temp, exdir = "./data")
                unlink(temp)
        }
        data <- read.csv("data/outcome-of-care-measures.csv", 
                         colClasses = "character")
        ##check whether the state is valid
        if(!state %in% data$State) stop("invalid state")
        ##check the validity of outcome
        outcome.list <- c("heart attack", "heart failure", "pneumonia")
        if(!outcome %in% outcome.list) stop("invalid outcome")
        ##select the outcome column
        index <- which(outcome.list %in% outcome)
        outcome.index <- c(11, 17, 23)[index]
        ##arrange and return data
        data <- data[data$State == state, ]
       suppressWarnings(data[, outcome.index] <- 
                                as.numeric(data[, outcome.index]))
        data <- data[order(data[, outcome.index]), ]
        data[1,2]
}