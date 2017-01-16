Dataset<- read.table("./household_power_consumption.txt", header = TRUE, sep= ";",dec=".")
subsetDate<-Dataset[Dataset$Date %in% c("1/2/2007","2/2/2007"),]
Globalactivepower<-as.numeric(subsetDate$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Globalactivepower,col="Red",main="Global Active Power",xlab = "Global Active Power(Kilowatts)" )
dev.off()