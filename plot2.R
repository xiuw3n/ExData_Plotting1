#plot2.R

#read the dataset
pc <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Convert to Date and Time
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time), format="%d/%m/%Y %H:%M:%S")
pc$Date <- format(as.Date(pc$Date, "%d/%m/%Y"))

#subset the dataset - 2007-02-01 and 2007-02-02
pc_feb <- pc[pc$Date >= "2007-02-01" & pc$Date <="2007-02-02",]

#convert dates to days of the week
library(ggplot2)
pc_feb$Global_active_power <- as.numeric(pc_feb$Global_active_power)

png(filename="plot2.png")
plot(pc_feb$DateTime, pc_feb$Global_active_power,type="l", 
     xlab = "" ,ylab = "Global Active Power (kilowatts)")
dev.off()

