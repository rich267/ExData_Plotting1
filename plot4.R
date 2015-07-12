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

png("plot4.png", width=480, height=480)

# 2 rows, 2 cols, populate rows first
par(mfrow=c(2,2))

# row 1, col 1 (originally plot2)

plot(filtered$dt, filtered$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# row 1, col 2

plot(filtered$dt, filtered$Voltage, type="l", xlab="datetime", ylab="Voltage")

# row 2, col 1 (originally plot3)

plot(filtered$dt, filtered$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")

lines(filtered$dt, filtered$Sub_metering_2, col="red")

lines(filtered$dt, filtered$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=c(2.5, 2.5), bty="n")

# row 2, col 2

plot(filtered$dt, filtered$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
