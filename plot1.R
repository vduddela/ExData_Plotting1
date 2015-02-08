library(sqldf)

data_subset <- read.csv.sql("./household_power_consumption.txt", header = T, sep=";", stringsAsFactors=F, sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

png(file="plot1.png", width=480, height=480)

hist(data_subset$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.off()