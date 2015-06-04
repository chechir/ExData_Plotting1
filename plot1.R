
dat=read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=F)
dat$Date2=as.Date(dat$Date, "%d/%m/%Y")
sub=subset(dat, dat$Date2>=as.Date("01-02-2007", "%d-%m-%Y") & dat$Date2<=as.Date("02-02-2007", "%d-%m-%Y"))
sub$DateTime=as.POSIXct(strptime(paste(sub$Date, sub$Time), "%d/%m/%Y %H:%M:%S"))

#Plot1: 
dev.copy(png, file="plot1.png")
hist(as.numeric(sub$Global_active_power), col="red", 
     xlab="Global Active Power(Kilowatss)", ylab="Frequency",
     main="Global Active Power")
dev.off()

