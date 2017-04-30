## Plot3
## This script loads the household_power_consumption data into R
## and graphs the energy submetering for sub meters 1 through 3 from 
## 2007-02-01 to 2007-02-02

library(dplyr)
library(lubridate)

##Read in the data
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")

##subset by the given dates and create a new DateTime element
pow<- subset(data, grepl("^[1,2]/2/2007",Date))
pow$DateTime <- dmy_hms(paste(pow$Date, pow$Time))

png("plot3.png")
plot(pow$DateTime, pow$Sub_metering_1, type ="n", ylab = "Energy sub metering", xlab ="")
lines(pow$DateTime, pow$Sub_metering_1, type ="l")
lines(pow$DateTime, pow$Sub_metering_2, type ="l", col ="red")
lines(pow$DateTime, pow$Sub_metering_3, type ="l", col ="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)
dev.off()
