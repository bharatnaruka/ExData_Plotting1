## read the file from wrking dir
power_con_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## get data into a dataframe only for two dates
TwoDay <- power_con_data[(power_con_data$Date == "1/2/2007")|(power_con_data$Date == "2/2/2007"),]


## Convert Date column into Date class
TwoDay$Date <- as.Date(TwoDay$Date,"%d/%m/%Y")

TwoDay$DateTime <- paste(TwoDay$Date, TwoDay$Time, sep=" ")

## merge date and time with striptime
TwoDay$DateTime <- strptime(TwoDay$DateTime,"%Y-%m-%d %H:%M:%S", tz="EST5EDT")


## open PNG device
png(file="plot2.png",width=480, height=480, unit="px")


## Create graph
plot(TwoDay$DateTime,TwoDay$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")

## close device
dev.off()