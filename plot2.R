
dat=read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)
dat$Date2=as.Date(dat$Date, "%d/%m/%Y")
sub=subset(dat, dat$Date2>=as.Date("01-02-2007", "%d-%m-%Y") & dat$Date2<=as.Date("02-02-2007", "%d-%m-%Y"))
sub$DateTime=as.POSIXct(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"))

#Plot2:
dev.copy(png, file="plot2.png")
plot(as.numeric(sub$Global_active_power)~sub$DateTime, type="l",
     ylab="Global Active Power(Kilowatss)", xlab="" )
dev.off()

