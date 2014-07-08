
#Read Data
input <-subset(read.table("household_power_consumption.txt", sep=";", dec="." , header=T), 
               
               as.Date(Date, format="%d/%m/%Y")=="2007-02-01" | as.Date(Date, format="%d/%m/%Y")=="2007-02-02")


# Convert factors to numerics
input$Sub_metering_1 <- as.numeric(levels(input$Sub_metering_1))[input$Sub_metering_1]
input$Sub_metering_2 <- as.numeric(levels(input$Sub_metering_2))[input$Sub_metering_2]


# Convert string to date time
input$dt <- strptime(paste(input$Date, input$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

# Plotting

png("plot3.png", width = 480, height = 480)

        with(input, plot(dt, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
        with(input, lines(dt, Sub_metering_1 ))
        with(input, lines(dt, Sub_metering_2, col="red" ))
        with(input, lines(dt, Sub_metering_3, col="blue" ))
        legend("topright", lty = 1 , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

