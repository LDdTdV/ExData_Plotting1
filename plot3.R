#open file
data<- read.table("C:/Curso R Coursera/Project 1 - Explanatory Graphs/household_power_consumption.txt", header= T, sep= ";", na.strings="?")
#extract the data from the table (dates 1/2/2007 - 2/2/2007)
subdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

submet1 <- as.numeric(subdata$Sub_metering_1)
submet2 <- as.numeric(subdata$Sub_metering_2)
submet3 <- as.numeric(subdata$Sub_metering_3)
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(subdata$Global_active_power)

#making the plot
plot(datetime, submet1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, submet2, type="l", col="red")
lines(datetime, submet3, type="l", col="blue")
  #add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex=0.5)
  #export to png file
dev.copy(png, file="plot3.png",width = 480, height = 480)
dev.off()