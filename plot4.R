plot2 <- function() {
        library(lubridate)
        
        totaldata <- read.csv("household_power_consumption.txt", sep = ";")
        
        data <- totaldata[(totaldata$Date == "1/2/2007" | totaldata$Date == "2/2/2007"), ]
        
        data$Date <- paste(data$Date, data$Time)
        data$Time <- NULL
        data$Date <- dmy_hms(data$Date)
        
        data$Sub_metering_1 <- as.character(data$Sub_metering_1)
        data$Sub_metering_1 <- as.numeric(Sub_metering_1)
        
        data$Sub_metering_2 <- as.character(data$Sub_metering_2)
        data$Sub_metering_2 <- as.numeric(Sub_metering_2)
        
        data$Sub_metering_3 <- as.character(data$Sub_metering_3)
        data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
        
        data$Voltage <- as.character(data$Voltage)
        data$Voltage <- as.numeric(data$Voltage)
        
        data$Global_reactive_power <- as.character(data$Global_reactive_power)
        data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
        
        png(filename = "plot4.png")
        
        ##arrange a 2, 2 matrix of graphs
        par(mfcol = c(2, 2))
        
        ##Top Left Graph
        with(data, plot(Date, Global_active_power, pch = ".", xlab = "", ylab = "Global Active Power (kilowatts)"))
        with(data, lines(Date, Global_active_power))
        
        ##Bottom Left Graph
        with(data, plot(Date, Sub_metering_1, pch = ".", xlab = "", ylab = "Energy sub metering"))
        with(data, lines(Date, Sub_metering_1))
        with(data, points(Date, Sub_metering_2, pch = ".", col = "red"))
        with(data, lines(Date, Sub_metering_2, col = "red"))
        with(data, points(Date, Sub_metering_3, pch = ".", col = "blue"))
        with(data, lines(Date, Sub_metering_3, col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        ##Top Right Graph
        with(data, plot(Date, Voltage, pch = ".", xlab = "datetime", ylab = "Voltage"))
        with(data, lines(Date, Voltage))
        
        #Bottom Right Graph
        with(data, plot(Date, Global_reactive_power, pch = ".", xlab = "datetime", ylab = "Global_reactive_power"))
        with(data, lines(Date, Global_reactive_power))
        
        dev.off()
}