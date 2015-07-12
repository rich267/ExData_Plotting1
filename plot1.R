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

png("plot1.png", width=480, height=480)

hist(filtered$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.off()
