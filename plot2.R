allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
targetData <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ]
dates <- as.Date(targetData[ ,1], "%d/%m/%Y")
times <- targetData[ ,2]
x <- as.POSIXct(paste(dates, times))
y <- targetData[ ,3]
plot(x, y, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(x, y, type = "l")
dev.copy(png, file = "plot2.png")
dev.off()