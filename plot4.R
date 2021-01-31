## plot4.R - Plots four individual graphs:
##   1 - Line graph of global active power over time
##   2 - Line graph showing each of the three sub meters power over time
##   3 - Line graph of voltage over time
##   4 - Line graph of global reactive power over time

## Read in the data, subset out the two days we want (1 - 2 Feb 2007) and convert power to numeric

power_data <- read.table("data/household_power_consumption.txt", sep = ';', header = TRUE)
sub_power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
sub_power_data$Global_active_power = as.numeric(sub_power_data$Global_active_power)
sub_power_data$DateTime = with(sub_power_data, strptime(paste(Date, Time), format = "%d/%m/%Y %T"))

## Open PNG file for output

png("plot4.png")

## Set parameter indicating we want 4 graphs (2 rows x 2 columns)

par(mfcol = c(2, 2))

##   1 - Line graph of global active power over time

with(sub_power_data, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

##   2 - Line graph showing each of the three sub meters power over time

with(sub_power_data, plot(DateTime, Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = ""))
with(sub_power_data, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(sub_power_data, points(DateTime, Sub_metering_3, col = "blue", type = "l"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

##   3 - Line graph of voltage over time

with(sub_power_data, plot(DateTime, Voltage, type = "l"))

##   4 - Line graph of global reactive power over time

with(sub_power_data, plot(DateTime, Global_reactive_power, type = "l"))

## Close the PNG device

dev.off()