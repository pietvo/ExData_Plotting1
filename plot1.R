# Read in the data

hh <- read.csv("household_power_consumption.txt", sep=";", 
               na.strings="?", stringsAsFactors=FALSE)

# Subset for dates 2007-02-01 and 2007-02-02

hh1 <- subset(hh, Date=="1/2/2007" | Date=="2/2/2007")

# Plot a PNG file

png(filename = "plot1.png", width = 480, height = 480)
hist(hh1$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
