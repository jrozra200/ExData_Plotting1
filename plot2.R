plot2 <- function() {
        library(lubridate)
        
        totaldata <- read.csv("household_power_consumption.txt", sep = ";")
        
        data <- totaldata[(totaldata$Date == "1/2/2007" | totaldata$Date == "2/2/2007"), ]
        
        data$Date <- paste(data$Date, data$Time)
        data$Time <- NULL
        data$Date <- dmy_hms(data$Date)
        
        data$Global_active_power <- as.character(data$Global_active_power)
        data$Global_active_power <- as.numeric(data$Global_active_power)
        
        png(filename = "plot2.png")
        with(data, plot(Date, Global_active_power, pch = ".", xlab = "", ylab = "Global Active Power (kilowatts)"))
        with(data, lines(Date, Global_active_power))
        dev.off()
}