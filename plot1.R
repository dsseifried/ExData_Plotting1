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

##Build Chart 
par(mfrow=c(1,1))
hist(readings2$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power")

##Make png file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot1.png",height=480, width=480)

##Close Device
dev.off()

