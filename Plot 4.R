##Plot 4
##Downloaded zip file and unzipped in my working directory
setwd("/Users/lindseygummersall/Documents/Data Science Coursera")
File <- "household_power_consumption.txt"
OrData <- read.table(file=File, header=TRUE, sep=";", na.strings="?")

##Subsetting Data
SubData <- OrData[OrData$Date %in% c("1/2/2007", "2/2/2007") ,]

##Converting global active power, global reactive power, subsub_metering
##and voltage columns to numeric
SubData$Global_active_power <- as.numeric(as.character(SubData$Global_active_power))
SubData$Global_reactive_power <- as.numeric(as.character(SubData$Global_reactive_power))
SubData$Sub_metering_1 <- as.numeric(as.character(SubData$Sub_metering_1))
SubData$Sub_metering_2 <- as.numeric(as.character(SubData$Sub_metering_2))
SubData$Sub_metering_3 <- as.numeric(as.character(SubData$Sub_metering_3))
SubData$Voltage <- as.numeric(as.character(SubData$Voltage))

##Creating New Column that Combines Date and Time data
SubData$TimeStamp <- paste(SubData$Date, SubData$Time)

###PNG Plot 4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(strptime(SubData$TimeStamp, "%d/%m/%Y %H:%M:%S"), SubData$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

plot(strptime(SubData$TimeStamp, "%d/%m/%Y %H:%M:%S"), SubData$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

plot(strptime(SubData$TimeStamp, "%d/%m/%Y %H:%M:%S"), SubData$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
  lines(strptime(SubData$TimeStamp, "%d/%m/%Y %H:%M:%S"), SubData$Sub_metering_2, col="red")
  lines(strptime(SubData$TimeStamp, "%d/%m/%Y %H:%M:%S"), SubData$Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", 
      "Sub_metering_3"), lty=c(1,1), lwd=c(1,1))

plot(strptime(SubData$TimeStamp, "%d/%m/%Y %H:%M:%S"), SubData$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
