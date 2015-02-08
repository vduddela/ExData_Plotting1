library(sqldf)

data_subset <- read.csv.sql("./household_power_consumption.txt", header = T, sep=";", stringsAsFactors=F, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)

par(mfrow =c(2,2))

plot(data_subset$DateTime, data_subset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(data_subset$DateTime, data_subset$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

plot(data_subset$DateTime, data_subset$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

lines(data_subset$DateTime, data_subset$Sub_metering_2, type="l", col="red", xlab = "", ylab = "Energy sub metering")

lines(data_subset$DateTime, data_subset$Sub_metering_3, type="l", col="blue", xlab = "", ylab = "Energy sub metering")

legend("topright", lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", col=c("black", "red", "blue"), cex=0.95) 

plot(data_subset$DateTime, data_subset$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()