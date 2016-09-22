##function to identify best hospital in a state for each outcome

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
        data <- data[order(data[, outcome.index], data[,2]), ]
        data[1,2]
}

##Function to rank hospitals by outcome in a state

rankhospital <- function(state, outcome, num="best"){
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
        data[, outcome.index] <- suppressWarnings(
                as.numeric(data[, outcome.index]))
        data <- data[order(data[, outcome.index], data[, 2]), ]
        data <- data[!is.na(data[, outcome.index]), ]
        ##converting best and worst to numbers
        if(num == "best") num <- 1
        if(num == "worst") num <- nrow(data)
        data[num,2]
}
##rank hospitals in all states

rankall <- function(outcome, num = "best"){
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
        ##check the validity of outcome
        outcome.list <- c("heart attack", "heart failure", "pneumonia")
        if(!outcome %in% outcome.list) stop("invalid outcome")
        ##select the outcome column
        index <- which(outcome.list %in% outcome)
        outcome.index <- c(11, 17, 23)[index]
        data[, outcome.index] <- suppressWarnings(
                as.numeric(data[ , outcome.index]))
        data <- data[!is.na(data[, outcome.index]), ]
        ##for each state give the hospital of a given rank
        states <- sort(unique(data$State))
        hospitals <- NULL
        for(i in states){
                rank <- num
                ##arrange and return data
                state.data <- data[data$State == i, ]
                ##converting best and worst to numbers
                state.data <- state.data[order(state.data[, outcome.index], 
                                               state.data[, 2]), ]
                if(rank == "best") rank <- 1
                if(rank == "worst") rank <- nrow(state.data)
                hospital <- state.data[rank, 2]
                hospitals <- c(hospitals, hospital)
        }
         
        
        ##return the result data frame
        output <- cbind(hospitals, states)
        output
}