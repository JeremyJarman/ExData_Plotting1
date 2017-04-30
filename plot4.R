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

##Open a png graphics device
png("plot4.png")
##Adjust the canvas to accept 4 graphs in 2x2 array
par(mfrow=c(2,2))

##Time to make some plots
##Top Left plot
plot(pow$DateTime, pow$Global_active_power, type ="l", ylab = "Global Active Power (kilowatts)", xlab ="")

##Top Right plot
plot(pow$DateTime, pow$Voltage, type ="l", ylab = "Voltage", xlab ="datetime")

##Bottom Left plot
plot(pow$DateTime, pow$Sub_metering_1, type ="n", ylab = "Energy sub metering", xlab ="")
lines(pow$DateTime, pow$Sub_metering_1, type ="l")
lines(pow$DateTime, pow$Sub_metering_2, type ="l", col ="red")
lines(pow$DateTime, pow$Sub_metering_3, type ="l", col ="blue")
legend("topright", inset =.02, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, box.lty=0)

##Bottom Right plot
plot(pow$DateTime, pow$Global_reactive_power, type ="l", xlab ="datetime")
##Close the graphics device
dev.off()
