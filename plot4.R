powerdata <- read.table("./household_power_consumption.txt", header = TRUE, 
                        na.strings = "?", sep = ";")
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
gooddates <- (as.Date(powerdata$DateTime) == as.Date("2007-02-01") | 
                as.Date(powerdata$DateTime) == as.Date("2007-02-02"))
newdata <- powerdata[gooddates,]
newdata$Time <- NULL
newdata$Date <- NULL

png(file = "plot4.png")
par(mfrow = c(2,2))
with(newdata, {
  #first plot
  plot(DateTime, Global_active_power, type = "l", xlab = "",  
       ylab = "Global Active Power", main = "")
  #second plot
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")
  #third plot
  plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
                     main = "", type = "n")
  lines(DateTime, Sub_metering_1, col = "black", type = "l")
  lines(DateTime, Sub_metering_2, col = "red", type = "l")
  lines(DateTime, Sub_metering_3, col = "blue", type = "l")
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #fourth plot
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", 
       ylab = "Global_reactive_power", main = "")
  
})
dev.off()