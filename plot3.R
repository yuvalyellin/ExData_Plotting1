table <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
table$Date <- as.Date(table$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007
table <- subset(table,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Remove incomplete observation
table <- table[complete.cases(table),]

## Combine Date and Time column
table$dateTime <- paste(table$Date, table$Time)
table$dateTime <- as.POSIXct(dateTime)

plot(table$Sub_metering_1~table$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(table$Sub_metering_2~table$dateTime,col='Red')
lines(table$Sub_metering_3~table$dateTime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()