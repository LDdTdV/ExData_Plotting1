#open file
data<- read.table("C:/Curso R Coursera/Project 1 - Explanatory Graphs/household_power_consumption.txt", header= T, sep= ";", na.strings="?")
#extract the data from the table (dates 1/2/2007 - 2/2/2007)
subdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

submet1 <- as.numeric(subdata$Sub_metering_1)
submet2 <- as.numeric(subdata$Sub_metering_2)
submet3 <- as.numeric(subdata$Sub_metering_3)
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subdata$Global_active_power)
globalreactivepower <- as.numeric(subdata$Global_reactive_power)
volt <- as.numeric(subdata$Voltage)

#choose png file
png("plot4.png", width=480, height=480)
#stablish vector
par(mfrow = c(2, 2))
par(m=c(1, 1, 1, 1))
#draw plots
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, submet1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, submet2, type="l", col="red")
lines(datetime, submet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o", cex=0.5)
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

