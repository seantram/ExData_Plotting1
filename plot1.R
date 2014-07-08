

#Read Data
input <-subset(read.table("household_power_consumption.txt", sep=";", dec="." , header=T), 
               
               as.Date(Date, format="%d/%m/%Y")=="2007-02-01" | as.Date(Date, format="%d/%m/%Y")=="2007-02-02")



# Convert factor to numeric
gap <- as.numeric(levels(input$Global_active_power))[input$Global_active_power]

# Plotting
png("plot1.png", width = 480, height = 480)

      hist(gap, col ="red", main="Global Active Power", xlab="Global Active Power (Kilowatts)")

dev.off()