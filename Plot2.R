setwd("~/ExData_Plotting1")

## Import Data

household_power_consumption <- read.csv("~/ExData_Plotting1/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

## Create datetime

household_power_consumption$DateTime <- as.POSIXct(paste(household_power_consumption$Date, household_power_consumption$Time), format="%d/%m/%Y %H:%M:%S") 

## Convert date

household_power_consumption$Date <- as.Date(household_power_consumption$Date, "%d/%m/%Y")

## Create working subset of the Original Data

workset <- subset(household_power_consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 2 - GLobal Active Power by Day

png(file = "Plot2.png")
plot(workset$DateTime, as.numeric(workset$Global_active_power), type = "n", ylab = "Global Active Power (kilowatts)", xlab = "", cex.axis = 0.8, cex.lab = .7)
lines(workset$DateTime, as.numeric(workset$Global_active_power))
dev.off()
