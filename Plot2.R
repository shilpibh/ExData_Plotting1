Sys.setlocale("LC_TIME","C")
Dataset<- read.table("./household_power_consumption.txt", header = TRUE, sep= ";",dec=".")
subsetDate<-Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007"),]

#str(subSetData) 
datetime <- strptime(paste(subsetDate$Date, subsetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

globalactivepower <- as.numeric(subsetDate$Global_active_power) 
png("plot2.png", width=480, height=480) 
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off() 
