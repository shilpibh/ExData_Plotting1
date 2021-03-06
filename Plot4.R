Sys.setlocale("LC_TIME","C")
Dataset<- read.table("./household_power_consumption.txt", header = TRUE, sep= ";",dec=".")
subsetDate<-Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007"),]

#str(subSetData) 
datetime <- strptime(paste(subsetDate$Date, subsetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  
globalactivepower <- as.numeric(subsetDate$Global_active_power) 
globalreactivepower <- as.numeric(subsetDate$Global_reactive_power)
voltage <- as.numeric(subsetDate$Voltage)
subMetering1 <- as.numeric(subsetDate$Sub_metering_1) 
subMetering2 <- as.numeric(subsetDate$Sub_metering_2) 
subMetering3 <- as.numeric(subsetDate$Sub_metering_3) 
 

png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2)) 
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 
