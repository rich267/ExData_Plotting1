# Exploratory Data Analysis
# Course project 1
# July 2015

# this file must be in current working directory; from unzipping
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
file <- "household_power_consumption.txt"

data <- read.table(file, header=T, sep=";", 
                   colClasses=c("character", "character", "double", "double", "double", "double", "double", "double", "double"), 
                   na.strings=c("?"))

# Only Feb 1 and Feb 2 2007
filtered <- data[data["Date"] == "1/2/2007" | data["Date"] == "2/2/2007",]

# make datetime col from date and time cols
filtered$dt <- strptime(paste(filtered$Date, filtered$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(filtered$dt, filtered$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")

lines(filtered$dt, filtered$Sub_metering_2, col="red")

lines(filtered$dt, filtered$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=c(2.5, 2.5))

dev.off()
