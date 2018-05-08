# Download and unzip data
if (!file.exists('PowerConsumption.zip')) {
      filetodownload <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
      download.file(filetodownload,destfile = 'PowerConsumption.zip')
}
unzip('PowerConsumption.zip',exdir = './Class4Week1')

##Load packages
library(dplyr)

##Load and Filter Data
readings<-read.table(file = './Class4Week1/household_power_consumption.txt', header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)
readings2<-filter(readings, Date %in% c("1/2/2007","2/2/2007"))

##object.size(readings) & Remove Original because of size
rm(readings)

##Format Date as Needed

readings2$Date <- as.Date(readings2$Date,"%d/%m/%Y")
readings2$DtTm <- as.POSIXct(paste(readings2$Date,readings2$Time))

##Set Layout
par(mfrow = c(2,2))

## Chart1
plot(readings2$DtTm,readings2$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)",type="l")

## Chart2
plot(readings2$DtTm,readings2$Voltage,xlab="datetime", ylab="Voltage",type="l")

## Chart3
plot(readings2$DtTm,readings2$Sub_metering_1,xlab="", ylab="Energy sub metering",type="l")
lines(readings2$DtTm,readings2$Sub_metering_2,col="red")
lines(readings2$DtTm,readings2$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=c(1,1,1),cex = 0.8)

## Chart4
plot(readings2$DtTm,readings2$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power",type="l")

##Make png file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot4.png", height=480, width=480)

##Close Device
dev.off()