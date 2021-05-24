library(readr)
library(lubridate)
library(dplyr)
setwd("~/Coursera/DataScience JHU/Exploratory Data Analysis/Week 1/ExData_Plotting1")
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", comment.char = "%", stringsAsFactors = FALSE, na.strings = "?")
dat$Date <- dmy(dat$Date)
dat <- dat %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

#plot2
datetime <- transform(dat, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(datetime$timestamp, datetime$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
