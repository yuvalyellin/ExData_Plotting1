url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption.zip"
download.file(url, file)
unzip(file, overwrite = T)
table <- read.table("household_power_consumption.txt", nrows=2075259, header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
table$Date <- as.Date(table$Date, "%d/%m/%Y")
table <- subset(table,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
hist(table$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()