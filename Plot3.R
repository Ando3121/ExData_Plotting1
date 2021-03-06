setwd("~/ExData_Plotting1")

## Import Data

household_power_consumption <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

## Create datetime

household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S") 

## Convert date

household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Create working subset of the Original Data

workset <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 3 - Submetering  1,2,3

png(file = "Plot3.png")

plot(workset$DateTime, as.numeric(workset$Sub_metering_1), type = "n", ylab = "Energy sub metering", xlab = "", cex.axis = 0.8, cex.lab = .7)
lines(workset$DateTime, as.numeric(workset$Sub_metering_1), col = "black")
lines(workset$DateTime, as.numeric(workset$Sub_metering_2), col = "red")
lines(workset$DateTime, as.numeric(workset$Sub_metering_3), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=.8, col=c("black","red", "blue"), lty=1)

dev.off()
