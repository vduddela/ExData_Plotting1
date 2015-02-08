library(sqldf)

data_subset <- read.csv.sql("./household_power_consumption.txt", header = T, sep=";", stringsAsFactors=F, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), "%d/%m/%Y %H:%M:%S")

plot(data_subset$DateTime, data_subset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)

dev.off()
