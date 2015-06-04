
dat=read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)
dat$Date2=as.Date(dat$Date, "%d/%m/%Y")
sub=subset(dat, dat$Date2>=as.Date("01-02-2007", "%d-%m-%Y") & dat$Date2<=as.Date("02-02-2007", "%d-%m-%Y"))
sub$DateTime=as.POSIXct(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"))

#Plot4: 
dev.copy(png, file="plot4.png")
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
plot(as.numeric(sub$Global_active_power)~sub$DateTime, type="l", ylab="Global Active Power", xlab="")
plot(as.numeric(sub$Voltage)~sub$DateTime, type="l", ylab="Voltage", xlab="datetime" )
plot(as.numeric(sub$Sub_metering_1)~sub$DateTime, type="l", ylab="Energy sub metering", xlab="" )
lines(as.numeric(sub$Sub_metering_2)~sub$DateTime, col="red")
lines(as.numeric(sub$Sub_metering_3)~sub$DateTime, col="blue")
legend("topright", cex=0.8, lty = 1, col = c("black", "blue", "red"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(as.numeric(sub$Global_reactive_power)~sub$DateTime, type="l", ylab="Global_reactive_power", xlab="datetime" )

dev.off()


