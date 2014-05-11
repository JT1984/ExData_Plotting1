filename <- "./data/household_power_consumption.txt"

columns <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

powerData <- read.table(filename,header=TRUE,sep=";",quote="",na.strings="?",colClasses=columns,comment.char="")

powerDataDates <- subset(powerData, powerData$Date == "1/2/2007" | powerData$Date == "2/2/2007")

dateTime <- strptime(paste(powerDataDates$Date, " ", powerDataDates$Time), "%d/%m/%Y %H:%M:%S")

dataSet <- cbind(powerDataDates, dateTime, stringsAsFactors = FALSE)

hist(dataSet$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()