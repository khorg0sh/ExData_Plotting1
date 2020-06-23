fpath<-"/home/khorgosh/Desktop/DataSets/household_power_consumption.txt"
DT <- read.csv(fpath, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subDT <- subset(DT, Date %in% c("1/2/2007","2/2/2007")) 
subDT$Date <- as.Date(subDT$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subDT$Date), subDT$Time)
subDT$Datetime <- as.POSIXct(datetime)

##step 1 :: construct the histogram on the screen

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0)) ##set the global parameters

with(subDT, {
  #plot 4.1
    plot(Global_active_power~Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="")
  #plot 4.2
    plot(Voltage~Datetime, type="l", 
          ylab="Voltage (volt)", xlab="")
  #plot 4.3
    plot(Sub_metering_1~Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #plot 4.4
    plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


##step 2 :: save the plot as png

dev.copy(png, file = "plot4.png", height=480, width= 480)
dev.off()

