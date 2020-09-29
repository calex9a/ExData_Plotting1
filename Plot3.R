## Plot 1 for Exploratory Data Analysis - Week 1
## Set working directory to folder that houses household_power_consumption.txt file
PowerTable<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=T,sep=";",na.strings="?")
CombTimeDate <- strptime(paste(PowerTable$Date, PowerTable$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
PowerTable <- cbind(PowerTable, CombTimeDate)
## Data conversion
PowerTable$Date<-as.Date(PowerTable$Date,format="%d/%m/%Y")
PowerTable$Time <- format(PowerTable$Time, format="%H:%M:%S")
## Data Plot
PowerTablePlot<-subset(PowerTable,Date=="2007-02-01"|Date=="2007-02-02")
png("Plot3.png",width=480,height=480)
with(PowerTablePlot, plot(CombTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy Sub Metering"))
lines(PowerTablePlot$CombTimeDate, PowerTablePlot$Sub_metering_2,type="l", col= "red")
lines(PowerTablePlot$CombTimeDate, PowerTablePlot$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
dev.off()