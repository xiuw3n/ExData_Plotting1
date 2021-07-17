#plot4.R

#read the dataset
pc <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Convert to Date and Time
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time), format="%d/%m/%Y %H:%M:%S")
pc$Date <- format(as.Date(pc$Date, "%d/%m/%Y"))

#subset the dataset - 2007-02-01 and 2007-02-02
pc_feb <- pc[pc$Date >= "2007-02-01" & pc$Date <="2007-02-02",]

#convert dates to days of the week
library(ggplot2)
pc_feb$Sub_metering_1 <- as.numeric(pc_feb$Sub_metering_1)
pc_feb$Sub_metering_2 <- as.numeric(pc_feb$Sub_metering_2)
pc_feb$Sub_metering_3 <- as.numeric(pc_feb$Sub_metering_3)
pc_feb$Voltage <- as.numeric(pc_feb$Voltage)
pc_feb$Global_reactive_power <- as.numeric(pc_feb$Global_reactive_power)
pc_feb$Global_active_power <- as.numeric(pc_feb$Global_active_power)

png(filename="plot4.png")
par(mfcol=c(2,2))
#plot1
plot(pc_feb$DateTime, pc_feb$Global_active_power,type="l", 
     xlab = "" ,ylab = "Global Active Power")

#plot2
plot(pc_feb$DateTime, pc_feb$Sub_metering_1,type="l", 
     xlab = "" ,ylab = "Energy sub metering",col="black")
lines(pc_feb$DateTime,pc_feb$Sub_metering_2, type = "l", col = "red")
lines(pc_feb$DateTime,pc_feb$Sub_metering_3, type = "l", col = "blue")
legend("topright",col=c("black","red","blue"),lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2,2,2),bty="n")

#plot3
plot(pc_feb$DateTime, pc_feb$Voltage,type="l",xlab="datetime",ylab="Voltage")

#plot4
plot(pc_feb$DateTime, pc_feb$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()