#Read Data
input <-subset(read.table("household_power_consumption.txt", sep=";", dec="." , header=T), 
               
               as.Date(Date, format="%d/%m/%Y")=="2007-02-01" | as.Date(Date, format="%d/%m/%Y")=="2007-02-02")


# Convert factor to numeric
input$gap <- as.numeric(levels(input$Global_active_power))[input$Global_active_power]

# Convert string to date time
input$dt <- strptime(paste(input$Date, input$Time, sep = " "), format="%d/%m/%Y %H:%M:%S")

# Plotting
png("plot2.png", width = 480, height = 480)

      with(input, plot(dt, gap, type="l", xlab="", ylab="Global Active Power (Kilowatts)"))

dev.off()


