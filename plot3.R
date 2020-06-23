fpath<-"/home/khorgosh/Desktop/DataSets/household_power_consumption.txt"
DT <- read.csv(fpath, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subDT <- subset(DT, Date %in% c("1/2/2007","2/2/2007")) 
subDT$Date <- as.Date(subDT$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subDT$Date), subDT$Time)
subDT$Datetime <- as.POSIXct(datetime)

##step 1 :: construct the histogram on the screen

with(subDT, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",
       col=c("black", "red", "blue"),
       lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##step 2 :: save the plot as png

dev.copy(png, file = "plot3.png", height=480, width= 480)
dev.off()
