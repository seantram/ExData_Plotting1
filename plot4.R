
#Read Data

input <-subset(read.table("household_power_consumption.txt", sep=";", dec="." , header=T), 
               
               as.Date(Date, format="%d/%m/%Y")=="2007-02-01" | as.Date(Date, format="%d/%m/%Y")=="2007-02-02")


# Convert factors to numerics

input$gap <- as.numeric(levels(input$Global_active_power))[input$Global_active_power]
input$Sub_metering_1 <- as.numeric(levels(input$Sub_metering_1))[input$Sub_metering_1]
input$Sub_metering_2 <- as.numeric(levels(input$Sub_metering_2))[input$Sub_metering_2]
input$Voltage <- as.numeric(levels(input$Voltage))[input$Voltage]
input$Global_reactive_power <- as.numeric(levels(input$Global_reactive_power))[input$Global_reactive_power]

# Convert string to date time
input$dt <- strptime(paste(input$Date, input$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")


# Plotting

png("plot4.png", width = 480, height = 480)
  par(mfrow = c(2, 2))
    with(input, {
  
        plot(dt, gap, type="l", xlab="", ylab="Global Active Power")
        
        plot(dt, Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        plot(dt, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
               lines(dt, Sub_metering_1 )   
               lines(dt, Sub_metering_2, col="red" )
               lines(dt, Sub_metering_3, col="blue" )
               legend("topright", lty = 1, bty = "n" , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
             
        plot(dt, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")    
         
       
})
dev.off()
