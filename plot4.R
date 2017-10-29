data<-read.table('/Users/sumeetmishra/Desktop/R_Programing/household_power_consumption.txt',sep=';',header=T,na.strings = "?")
sub_data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(sub_data$Global_active_power)
GRP<-as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)
subM1 <- as.numeric(sub_data$Sub_metering_1)
subM2 <- as.numeric(sub_data$Sub_metering_2)
subM3 <- as.numeric(sub_data$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subM1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()