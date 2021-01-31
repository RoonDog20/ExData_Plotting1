## plot3.R - Plots three line graphs of the sub metering power by time

## Read in the data, subset out the two days we want (1 - 2 Feb 2007) and convert power to numeric

power_data <- read.table("data/household_power_consumption.txt", sep = ';', header = TRUE)
sub_power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
sub_power_data$Global_active_power = as.numeric(sub_power_data$Global_active_power)
sub_power_data$DateTime = with(sub_power_data, strptime(paste(Date, Time), format = "%d/%m/%Y %T"))

## Open PNG file for output

png("plot3.png")

## Set parameters for single plot

par(mfrow = c(1, 1))

## Plot line graph of each sub_metering power power by time

with(sub_power_data, plot(DateTime, Sub_metering_1, col = "black", type = "l", ylab = "Energy sub metering", xlab = ""))
with(sub_power_data, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(sub_power_data, points(DateTime, Sub_metering_3, col = "blue", type = "l"))

## Add legend for which line color corresponds to which sub_metering

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

## Close the PNG file

dev.off()