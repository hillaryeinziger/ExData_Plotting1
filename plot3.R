powerdata <- read.table("./household_power_consumption.txt", header = TRUE, 
                        na.strings = "?", sep = ";")
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
gooddates <- (as.Date(powerdata$DateTime) == as.Date("2007-02-01") | 
                as.Date(powerdata$DateTime) == as.Date("2007-02-02"))
newdata <- powerdata[gooddates,]
newdata$Time <- NULL
newdata$Date <- NULL

png(file = "plot3.png")
with(newdata, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
                   main = "", type = "n"))
with(newdata, lines(DateTime, Sub_metering_1, col = "black", type = "l"))
with(newdata, lines(DateTime, Sub_metering_2, col = "red", type = "l"))
with(newdata, lines(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()