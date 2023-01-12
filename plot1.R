#open file
data<- read.table("C:/Curso R Coursera/Project 1 - Explanatory Graphs/household_power_consumption.txt", header= T, sep= ";", na.strings="?")
#extract the data from the table (dates 1/2/2007 - 2/2/2007)
subdata<- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Plot 1 - Histogram
hist(as.numeric(subdata$Global_active_power), col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)")
  #extract to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()