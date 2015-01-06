powerdata <- read.table("./household_power_consumption.txt", header = TRUE, 
                        na.strings = "?", sep = ";")
powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
gooddates <- (as.Date(powerdata$DateTime) == as.Date("2007-02-01") | 
                as.Date(powerdata$DateTime) == as.Date("2007-02-02"))
newdata <- powerdata[gooddates,]
newdata$Time <- NULL
newdata$Date <- NULL

## Up to here goes in every program file

png(file="plot1.png")
with(newdata, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", 
                   ylab = "Frequency", col = "red", main = "Global Active Power"))
dev.off()