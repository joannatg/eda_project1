
#Data downloaded from  
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
getwd()
setwd("C:\\Users\\Joanna\\Desktop\\R_coursera\\EDA\\")

##Plot 1 Global Active Power
d <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
d_c <- subset(d, Date %in% c("1/2/2007","2/2/2007"))
d_c$Date <- as.Date(d_c$Date, format="%d/%m/%Y")
hist(d_c$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Blue")


##Plot 2 
dateTime <- paste(as.Date(d_c$Date), d_c$Time)
d_c$Datetime <- as.POSIXct(dateTime)

with(d_c, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
title(main="Global Active Power over Time")

##Plot 3 
with(d_c, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Green')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "green", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# annotating graph
title(main="Energy sub-metering")

##Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(d_c, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Green')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "green", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="datetime")
})


