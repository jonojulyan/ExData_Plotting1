#To run successfully copy the unzipped data file into the same folder as this file
#Get Data
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- format(strptime(data$Time,"%H:%M:%S"),"%H:%M:%S")
data <- subset(data,(data$Date == "2007-02-01") | (data$Date == "2007-02-02"))
#Join date and time
dataDateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
#Create Plots
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(x = dataDateTime, y = data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(x = dataDateTime, y = data$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(x = dataDateTime, y = data$Sub_metering_1, type = "l" , ylab = "Energy sub metering", xlab = "")
lines(x = dataDateTime, y = data$Sub_metering_2, type = "l", col = "red")
lines(x = dataDateTime, y = data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x = dataDateTime, y = data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()