## read the file from wrking dir
power_con_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## get data into a dataframe only for two dates
TwoDay <- power_con_data[(power_con_data$Date == "1/2/2007")|(power_con_data$Date == "2/2/2007"),]



## Convert Date column into Date class
TwoDay$Date <- as.Date(TwoDay$Date, "%d/%m/%Y")

## concatenate date and time
TwoDay$DateTime <- paste(TwoDay$Date, TwoDay$Time, sep=" ")

## convert date and time with striptime
TwoDay$DateTime <- strptime(TwoDay$DateTime,"%Y-%m-%d %H:%M:%S", tz="EST5EDT")


## open PNG device
png(file="plot3.png",width=480, height=480, unit="px")


## Create graph
with(TwoDay, plot(DateTime, Sub_metering_1, type="n",xlab="", ylab="Energy sub metering"))
with(TwoDay, points(DateTime, Sub_metering_1, type="l"))
with(TwoDay, points(DateTime, Sub_metering_2, type="l", col="red"))
with(TwoDay, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", col=c("black","red","blue"), pch="--", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## close device
dev.off()