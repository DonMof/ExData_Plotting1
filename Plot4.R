plot4week1 <- function () {
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

  png(file="plot4.png")
  
  subsetofpd$newdate <-paste(as.character(subsetofpd[,"Date"]), as.character(subsetofpd[,"Time"]))
  

 
  #specify the layout of the plots
  par(mfrow=c(2,2))
  #First plot - Top left
  plot(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Global_active_power)),typ="l",xlab=" ", ylab="Global Active Power (kilowatts)")
  #Second plot - Top right
  plot(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Voltage)),typ="l",xlab="datetime", ylab="Voltage")
  #Third plot - Bottom left
  plot(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_1)),typ="l",ylim=c(0,40),xlab=" ", ylab="Energy Sub Metering")
  points(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_3)),col="blue",typ="l")
  lines(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_3)),col="blue")
  points(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_2)),col="red",typ="l")
  lines(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Sub_metering_2)),col="red",typ="l")
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
         col=c("black","red", "blue"),lty=1,bty="n")
  #Fourth plot - Bottom right
  plot(as.POSIXlt(subsetofpd$newdate,format="%d/%m/%Y%t%H:%M:%S"),as.numeric(as.character(subsetofpd$Global_reactive_power)),typ="l",xlab="datetime", ylab="Global_reactive_power")

  dev.off()
  
  
    }
