allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
targetData <- allData[allData$Date == "1/2/2007" | allData$Date == "2/2/2007", ]
hist(targetData[,3], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()