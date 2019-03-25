#To run successfully copy the unzipped data file into the same folder as this file
#Get Data
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- format(strptime(data$Time,"%H:%M:%S"),"%H:%M:%S")
data <- subset(data,(data$Date == "2007-02-01") | (data$Date == "2007-02-02"))
#Create Plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(x = strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"), y = data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()