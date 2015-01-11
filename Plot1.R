##Config working directory
setwd("C:/Users/Stickman/R working directory/Data explore")

## Open all data
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Select two days of interest
data_small <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Change date 
date_time <- paste(as.Date(data_small$Date), data_small$Time)
data_small$Datetime <- as.POSIXct(date_time)

## Create Plot 
hist(data_small$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()