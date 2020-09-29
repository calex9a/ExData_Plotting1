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
png("Plot2.png",width=480,height=480)
with(PowerTablePlot, plot(CombTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
dev.off()