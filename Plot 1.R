library(readr)
library(lubridate)
library(dplyr)
setwd("~/Coursera/DataScience JHU/Exploratory Data Analysis/Week 1/ExData_Plotting1")
dat <- read.table("household_power_consumption.txt", header = T, sep = ";", comment.char = "%", stringsAsFactors = FALSE, na.strings = "?")
dat$Date <- dmy(dat$Date)
dat <- dat %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

#plot1 
par(mfrow = c(1,1))
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()