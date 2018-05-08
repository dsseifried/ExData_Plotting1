# Download and unzip data
if (!file.exists('PowerConsumption.zip')) {
      filetodownload <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
      download.file(filetodownload,destfile = 'PowerConsumption.zip')
}
unzip('PowerConsumption.zip',exdir = './Class4Week1')

library(dplyr)

readings<-read.table(file = './Class4Week1/household_power_consumption.txt', header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)
readings2<-filter(readings, Date %in% c("1/2/2007","2/2/2007"))

##object.size(readings) & Remove
rm(readings)

##Format Date as Needed

readings2$Date <- as.Date(readings2$Date,"%d/%m/%Y")
readings2$DtTm <- as.POSIXct(paste(readings2$Date,readings2$Time))

##Build Chart 
plot(readings2$DtTm,readings2$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)",type="l")

##Make png file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot2.png")

##Close Device
dev.off()