# Read in the data

hh <- read.csv("household_power_consumption.txt", sep=";", 
               na.strings="?", stringsAsFactors=FALSE)

# Subset for dates 2007-02-01 and 2007-02-02

hh1 <- subset(hh, Date=="1/2/2007" | Date=="2/2/2007")

# Convert Date/Time to POSIXct

hh1$Time <- as.POSIXct(strptime(paste(hh1$Date, hh1$Time), "%d/%m/%Y %H:%M:%S"))

# Plot a PNG file

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), cex=0.8)

# First plot -- Global Active Power

plot(hh1$Time, hh1$Global_active_power, xlab="", 
     ylab="Global Active Power", type="l")

# Second plot -- Voltage

plot(hh1$Time, hh1$Voltage, xlab="datetime", 
     ylab="Voltage", type="l")

# Third plot -- Sub metering

plot(hh1$Time, hh1$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l")
lines(hh1$Time, hh1$Sub_metering_2, col="red")
lines(hh1$Time, hh1$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), bty="n", lty=1, y.intersp=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth plot -- Global Reactive Power

plot(hh1$Time, hh1$Global_reactive_power, xlab="datetime", 
     ylab="Global_reactive_power", type="l")

dev.off()