powerdata <- read.table("./household_power_consumption.txt", header = TRUE, 
                        na.strings = "?", sep = ";")
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
gooddates <- (as.Date(powerdata$DateTime) == as.Date("2007-02-01") | 
                as.Date(powerdata$DateTime) == as.Date("2007-02-02"))
newdata <- powerdata[gooddates,]
newdata$Time <- NULL
newdata$Date <- NULL

png(file = "plot2.png")
with(newdata, plot(DateTime, Global_active_power, type = "l" xlab = "",  
                ylab = "Global Active Power (kilowatts)", main = ""))
dev.off()