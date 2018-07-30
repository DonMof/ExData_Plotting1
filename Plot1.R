plot1week1 <- function () {
  #install.packages("dplyr")
  #install.packages("data.table")        # install it
  library(dplyr)
  library(data.table)
    # Week 1 plot 1 file
    # Read in the zip file
    

  power_data <- read.table("household_power_consumption.txt",sep=";",header=T)
  
  #Create a subset of the data with only the values needed.
  subsetofpd <- data.frame()
  for (i in 1:2075259) {
  if ((power_data[i,"Date"]=="1/2/2007") | (power_data[i,"Date"]=="2/2/2007")) {
  subsetofpd <- rbind(subsetofpd,power_data[i,])
  }
  }
  #Create a PNG File with the histogram
  png(file="plot1.png")
  hist(as.numeric(as.character(subsetofpd[,"Global_active_power"])),col="red",breaks=11,main="Global Active Power",xlab="Global Active Power (Kilowatts)")
  dev.off()
  
  
    }
