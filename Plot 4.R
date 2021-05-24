library(readr)
library(lubridate)
library(dplyr)
setwd("~/Coursera/DataScience JHU/Exploratory Data Analysis/Week 1/ExData_Plotting1")
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", comment.char = "%", stringsAsFactors = FALSE, na.strings = "?")
dat$Date <- dmy(dat$Date)
dat <- dat %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

#plot4
datetime <- transform(dat, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
#plot 4.1
plot(datetime$timestamp, datetime$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

#plot 4.2
plot(datetime$timestamp, datetime$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot 4.3
plot(datetime$timestamp, datetime$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime$timestamp, datetime$Sub_metering_2, col = "red")
lines(datetime$timestamp, datetime$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1), cex = 0.4)

#plot 4.3
plot(datetime$timestamp, datetime$Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
