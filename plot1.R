# Read data
data_read <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 69520)

# Subset data set to include only dates of interest
data <- subset(data_read, data_read$Date == "1/2/2007" | data_read$Date == "2/2/2007")

# Construct datetime variable
data$DateTime <- paste(data[,1], data[,2], sep = " ")
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# Set variable to numeric type
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# Plot
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
