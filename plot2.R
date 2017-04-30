## Plot2
## This script loads tha the household_power_consumption data into R
## and generates line graph of the Global Active Power from 
## 2007-02-01 to 2007-02-02

library(dplyr)
library(lubridate)

##Read in the data
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

##subset by the given dates and create a new DateTime element
pow<- subset(data, grepl("^[1,2]/2/2007",Date))
pow$DateTime <- dmy_hms(paste(pow$Date, pow$Time))

png("plot2.png")
plot(pow$DateTime, pow$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()
