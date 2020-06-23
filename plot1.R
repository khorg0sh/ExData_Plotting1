fpath<-"/home/khorgosh/Desktop/DataSets/household_power_consumption.txt"
DT <- read.csv(fpath, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subDT <- subset(DT, Date %in% c("1/2/2007","2/2/2007")) 
subDT$Date <- as.Date(subDT$Date, format="%d/%m/%Y")    
datetime <- paste(as.Date(subDT$Date), subDT$Time)
subDT$Datetime <- as.POSIXct(datetime)

##step 1 :: construct the histogram on the screen

hist(subDT$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency",
     col="Red")

##step 2 :: save the plot as png

dev.copy(png, file = "plot1.png", height=480, width= 480)
dev.off()
