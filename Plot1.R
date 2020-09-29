## Plot 1 for Exploratory Data Analysis - Week 1
## Set working directory to folder that houses household_power_consumption.txt file
PowerTable<-read.table("household_power_consumption.txt",stringsAsFactors=FALSE,header=T,sep=";",na.strings="?")
## Data conversion
PowerTable$Date<-as.Date(PowerTable$Date,format="%d/%m/%Y")
PowerTable$Time <- format(PowerTable$Time, format="%H:%M:%S")
## Data Plot
PowerTablePlot<-subset(PowerTable,Date=="2007-02-01"|Date=="2007-02-02")
png("Plot1.png",width=480,height=480)
hist(PowerTablePlot$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()