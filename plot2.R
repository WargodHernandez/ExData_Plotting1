x<-read.table("household_power_consumption.txt", TRUE, ";", na.strings = "?")
x<-x[x$Date %in% c("1/2/2007","2/2/2007") ,]

DTme<-paste(x$Date,x$Time)
DTme<-strptime(DTme,"%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(DTme, x$Global_active_power,ylab="global active power",xlab="",type="l")
dev.off()
