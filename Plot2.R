plot2week1 <- function () {
  #install.packages("dplyr")
  #install.packages("data.table")        # install it
  library(dplyr)
  library(data.table)
  library(lubridate)
    # Week 1 plot 1 file
    # Read in the zip file
    

  power_data <- read.table("household_power_consumption.txt",sep=";",header=T)
  

  subsetofpd <- data.frame()
  for (i in 1:2075259) {
  if ((power_data[i,"Date"]=="1/2/2007") | (power_data[i,"Date"]=="2/2/2007")) {
  subsetofpd <- rbind(subsetofpd,power_data[i,])
  }
  }
 #Create PNG 
  png(file="plot2.png")
  #Change the data type of the Date and Time and paste the results together
  subsetofpd$newdate <-paste(as.character(subsetofpd[,"Date"]), as.character(subsetofpd[,"Time"]))
  
  #Identify the format the date and plot the data
 
  plot(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(subsetofpd$Global_active_power),xlab=" ", ylab="Global Active Power (kilowatts)", typ="l")
  
  dev.off()
  
  
    }
