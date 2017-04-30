## Plot1
## This script loads tha the household_power_consumption data into R
## and generates a histogram of the Global Frequency Power from 
## 2007-02-01 to 2007-02-02
library(dplyr)

##Read in the data
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE, stringsAsFactors = FALSE, na.strings = "?")
##Subset the data by the given dates
pow<- subset(data, grepl("^[1,2]/2/2007",Date))

png("plot1.png")
hist(pow$Global_active_power, main = "Global Active Power", col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)")
dev.off()
