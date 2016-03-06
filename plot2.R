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

# to png
png("plot2.png", 480, 480)

# print the line chart
plot(x$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     xaxt = "n")

axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

# close png device
dev.off()