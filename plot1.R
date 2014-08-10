x<-read.table("household_power_consumption.txt", TRUE, ";", na.strings = "?")
x<-x[x$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png", width = 480, height = 480)
hist(as.numeric(x$Global_active_power), col="red",
     main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
