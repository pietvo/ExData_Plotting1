# Read in the data

hh <- read.csv("household_power_consumption.txt", sep=";", 
               na.strings="?", stringsAsFactors=FALSE)

# Subset for dates 2007-02-01 and 2007-02-02

hh1 <- subset(hh, Date=="1/2/2007" | Date=="2/2/2007")

# Convert Date/Time to POSIXct

hh1$Time <- as.POSIXct(strptime(paste(hh1$Date, hh1$Time), "%d/%m/%Y %H:%M:%S"))

# Plot a PNG file

png(filename = "plot3.png", width = 480, height = 480)
plot(hh1$Time, hh1$Sub_metering_1, xlab="", 
     ylab="Energy sub metering", type="l")
lines(hh1$Time, hh1$Sub_metering_2, col="red")
lines(hh1$Time, hh1$Sub_metering_3, col="blue")

legend("topright", col=c("black", "red", "blue"), lty=1, y.intersp=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()