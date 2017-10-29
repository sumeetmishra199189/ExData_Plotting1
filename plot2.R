data<-read.table('/Users/sumeetmishra/Desktop/R_Programing/household_power_consumption.txt',sep=';',header=T,na.strings = "?")
sub_data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP<-as.numeric(sub_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()