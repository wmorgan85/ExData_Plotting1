setwd("~/rwork/ExData_Plotting1/")

# load all data
elec_data <- read.table("data.txt", header = T, sep = ";", stringsAsFactors = F)

# convert types
elec_data$Date <- dmy(elec_data$Date)
elec_data$Time <- hms(elec_data$Time)

# filter out only first two days of feb
x <- elec_data[elec_data$Date == ymd("20070201") | elec_data$Date == ymd("20070202"),]

# convert smaller dataset to numeric
x$Global_active_power <- as.numeric(x$Global_active_power)
x$Global_reactive_power <- as.numeric(x$Global_reactive_power)
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)
x$Voltage <- as.numeric(x$Voltage)

# to png
png("plot4.png", 480, 480)

# split to 4 plots
par(mfrow=c(2,2))

# plot 1 - same as ex2
plot(x$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))


# plot 2 - voltage
plot(x$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",
     xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))


# plot 3 - same as ex3
plot(x$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = "n")
lines(x$Sub_metering_2, col = "red")
lines(x$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1,1,1),
       bty = "n")


# plot 4 - global reactive power
plot(x$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",
     xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# close png device
dev.off()

# reset frame to single plot
par(mfrow=c(1,1))