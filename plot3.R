library(sqldf)

data_subset <- read.csv.sql("./household_power_consumption.txt", header = T, sep=";", stringsAsFactors=F, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width=480, height=480)

plot(data_subset$DateTime, data_subset$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")

lines(data_subset$DateTime, data_subset$Sub_metering_2, type="l", col="red", xlab = "", ylab = "Energy sub metering")

lines(data_subset$DateTime, data_subset$Sub_metering_3, type="l", col="blue", xlab = "", ylab = "Energy sub metering")

legend("topright", lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), cex=0.95) 

dev.off()