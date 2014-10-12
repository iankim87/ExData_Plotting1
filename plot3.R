# Read data
data_read <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 69520)

# Subset data set to include only dates of interest
data <- subset(data_read, data_read$Date == "1/2/2007" | data_read$Date == "2/2/2007")

# Construct datetime variable
data$DateTime <- paste(data[,1], data[,2], sep = " ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Set variables to numeric type
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

# Create data subset for plotting
sub_metering_data <- subset(data, select = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot_colors <- c("black", "red", "blue")


# Plot
png(filename = "plot3.png", width = 480, height = 480)
plot(data$DateTime, sub_metering_data$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering", col = plot_colors[1])
lines(data$DateTime, sub_metering_data$Sub_metering_2, type = "l", col = plot_colors[2])
lines(data$DateTime, sub_metering_data$Sub_metering_3, type = "l", col = plot_colors[3])
legend("topright", names(sub_metering_data), lty = c(1, 1), col = plot_colors)
dev.off()

