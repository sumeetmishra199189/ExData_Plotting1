data<-read.table('/Users/sumeetmishra/Desktop/R_Programing/household_power_consumption.txt',sep=';',header=T,na.strings = "?")
sub_data<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GAP<-as.numeric(sub_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GAP,col='red',xlab='Global Active Power(kilowatts)',main='Global Active Power')
dev.off()