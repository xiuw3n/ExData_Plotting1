#plot1.R

#read the dataset
pc <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
#Convert to Date and Time
pc$Date <- format(as.Date(pc$Date, "%d/%m/%Y"))

#subset the dataset - 2007-02-01 and 2007-02-02
pc_feb <- pc[pc$Date >= "2007-02-01" & pc$Date <="2007-02-02",]

#plot the histogram
pc_feb$Global_active_power <- as.numeric(pc_feb$Global_active_power)
png(filename="plot1.png")
hist(pc_feb$Global_active_power,col="red",main="Global Active Power"
     ,xlab="Global Active Power(kilowatts)")
dev.off()