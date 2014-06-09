allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
targetData <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ]
dates <- as.Date(targetData[ ,1], "%d/%m/%Y")
times <- targetData[ ,2]
x <- as.POSIXct(paste(dates, times))
y <- targetData[ ,3]

par(mfcol = c(2,2))

plot(x, y, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(x, y, type = "l")

y1 <- targetData[ ,7]
y2 <- targetData[ ,8]
y3 <- targetData[ ,9]
plot(x, y1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x, y1, type = "l", col = "black")
lines(x, y2, type = "l", col = "red")
lines(x, y3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

y4 <- targetData[ ,5]
plot(x, y4, type = "n", xlab = "datetime", ylab = "Voltage")
lines(x, y4, type = "l")

y5 <- targetData[ ,4]
plot(x, y5, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(x, y5, type = "l")


dev.copy(png, file = "plot4.png")
dev.off()