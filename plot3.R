setwd("~/rwork/ExData_Plotting1/")

# load all data
elec_data <- read.table("data.txt", header = T, sep = ";", stringsAsFactors = F)

# convert types
elec_data$Date <- dmy(elec_data$Date)
elec_data$Time <- hms(elec_data$Time)

# filter out only first two days of feb
x <- elec_data[elec_data$Date == ymd("20070201") | elec_data$Date == ymd("20070202"),]

# convert smaller dataset to numeric
x$Sub_metering_1 <- as.numeric(x$Sub_metering_1)
x$Sub_metering_2 <- as.numeric(x$Sub_metering_2)
x$Sub_metering_3 <- as.numeric(x$Sub_metering_3)

# to png
png("plot3.png", 480, 480)

# print the chart
plot(x$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     xaxt = "n")
lines(x$Sub_metering_2, col = "red")
lines(x$Sub_metering_3, col = "blue")

# add custom axis
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# add legend
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = c(1,1,1))


# close png device
dev.off()