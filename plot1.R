#To run successfully copy the unzipped data file into the same folder as this file
#Get Data
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- format(strptime(data$Time,"%H:%M:%S"),"%H:%M:%S")
data <- subset(data,(data$Date == "2007-02-01") | (data$Date == "2007-02-02"))
#Create Plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data$Global_active_power),col = "red", main = "Global Active power", xlab = "Global Active Power (kilowatts)")
dev.off()