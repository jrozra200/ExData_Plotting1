plot1 <- function() {
        totaldata <- read.csv("household_power_consumption.txt", sep = ";")
        
        data <- totaldata[(totaldata$Date == "1/2/2007" | totaldata$Date == "2/2/2007"), ]
        
        data$Global_active_power <- as.character(data$Global_active_power)
        data$Global_active_power <- as.numeric(data$Global_active_power)
        
        png(filename = "plot1.png")
        hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
        dev.off()
}