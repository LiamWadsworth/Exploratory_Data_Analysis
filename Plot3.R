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
with(data_small, {
  plot(Sub_metering_1~data_small$Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~data_small$Datetime,col='Red')
  lines(Sub_metering_3~data_small$Datetime,col='Blue')
})

## Add legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

