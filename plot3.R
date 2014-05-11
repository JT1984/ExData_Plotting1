filename <- "./data/household_power_consumption.txt"

columns <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

powerData <- read.table(filename,header=TRUE,sep=";",quote="",na.strings="?",colClasses=columns,comment.char="")

powerDataDates <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007")

dateTime <- strptime(paste(powerDataDates$Date, " ", powerDataDates$Time), "%d/%m/%Y %H:%M:%S")

dataSet <- cbind(powerDataDates, dateTime, stringsAsFactors = FALSE)

png(filename = "plot3.png", width = 480, height = 480)

with(dataSet, plot(dateTime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(dataSet, lines(dateTime, Sub_metering_1, col = "black"))
with(dataSet, lines(dateTime, Sub_metering_2, col = "red"))
with(dataSet, lines(dateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()