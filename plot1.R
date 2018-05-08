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

##Format Date if needed

readings2$Date <- as.Date(readings2$Date,"%d/%m/%Y")

##Build Chart 
hist(readings2$Global_active_power,col="red", xlab="Global Active Power (kilowatts)",ylab="Frequency",main = "Global Active Power")

##Make png file
dev.copy(png, file = "./GitHub/ExData_Plotting1/plot1.png")

##Close Device
dev.off()

