#open file
data<- read.table("C:/Curso R Coursera/Project 1 - Explanatory Graphs/household_power_consumption.txt", header= T, sep= ";", na.strings="?")
#extract the data from the table (dates 1/2/2007 - 2/2/2007)
subdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(subdata$Global_active_power)

#draw plot
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  #save to png file
dev.copy(png, file="plot2.png",width = 480, height = 480)
dev.off()
