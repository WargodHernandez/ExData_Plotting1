x<-read.table("household_power_consumption.txt", TRUE, ";", na.strings = "?")
x<-x[x$Date %in% c("1/2/2007","2/2/2007") ,]

DTme<-paste(x$Date,x$Time)
DTme<-strptime(DTme,"%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

plot(DTme, x$Global_active_power,ylab="global active power",xlab="",type="l")
plot(DTme, x$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(DTme, x$Sub_metering_1, pch = NA, ylab="Energy Submetering", xlab="",type="l",yaxt = "n")
lines(DTme, x$Sub_metering_1, type="l", col="black")
lines(DTme, x$Sub_metering_2, type="l", col="red")
lines(DTme, x$Sub_metering_3, type="l", col="blue")
axis(side = 2, at = seq(from = 0, to = 30, by = 10))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),
       lwd=c(1,1,1),cex=0.75,col=c("black", "red", "blue"))
plot(DTme, x$Global_reactive_power, type = "l", main = "", xlab = "datetime")

dev.off()
