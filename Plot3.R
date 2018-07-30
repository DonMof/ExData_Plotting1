plot3week1 <- function () {
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

  png(file="plot3.png")
  
  subsetofpd$newdate <-paste(as.character(subsetofpd[,"Date"]), as.character(subsetofpd[,"Time"]))
  
 
  #Plot all of the graphs together.  
  plot(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_1)),typ="l",ylim=c(0,40),xlab=" ", ylab="Energy Sub Metering")
  #Include the additional data via lines and points specifications
  points(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_3)),col="blue",typ="l")
  lines(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_3)),col="blue")
  points(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_2)),col="red",typ="l")
  lines(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_2)),col="red",typ="l")
  #Add the legend
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
         col=c("black","red", "blue"),lty=1)
  dev.off()
  
  
    }
