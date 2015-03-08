## read the file from wrking dir
power_con_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## get data into a dataframe only for two dates
twodaydata <- power_con_data[(power_con_data$Date == "1/2/2007")|(power_con_data$Date == "2/2/2007"),]

## open PNG device
png(file="plot1.png", width=480, height=480, unit="px")

## Create histogram
hist(twodaydata$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")


## close device
dev.off()