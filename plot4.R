table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
table$Date <- as.Date(table$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
table <- subset(table,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
table <- table[complete.cases(table),]

## Combine Date and Time column
table$dateTime <- paste(table$Date, table$Time)
table$dateTime <- as.POSIXct(table$dateTime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(table$Global_active_power~table$dateTime, type="l",     ylab="Global Active Power (kilowatts)", xlab="")
plot(table$Voltage~table$dateTime, type="l", ylab="Voltage (volt)", xlab="datetime")
plot(table$Sub_metering_1~table$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(table$Sub_metering_2~table$dateTime,col='Red')
lines(table$Sub_metering_3~table$dateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(table$Global_reactive_power~table$dateTime, type="l", ylab="Global Rective Power (kilowatts)",xlab="datetime")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()