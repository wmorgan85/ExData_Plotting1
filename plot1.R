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
png("plot1.png", 480, 480, 300)

# print the histogram
hist(x = x$Global_active_power, 
     xlab = "Global Active Power (kwh)", 
     col = "red", 
     main = "Global Active Power")

# close png device
dev.off()