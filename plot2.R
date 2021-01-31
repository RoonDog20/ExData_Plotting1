## plot2.R - Plots a line graph of Global Active Power by time

## Read in the data, subset out the two days we want (1 - 2 Feb 2007) and convert power to numeric

power_data <- read.table("data/household_power_consumption.txt", sep = ';', header = TRUE)
sub_power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
sub_power_data$Global_active_power = as.numeric(sub_power_data$Global_active_power)
sub_power_data$DateTime = with(sub_power_data, strptime(paste(Date, Time), format = "%d/%m/%Y %T"))

## Open PNG file for output

png("plot2.png")

## Set parameter for single plot

par(mfrow = c(1, 1))

## Plot line graph of global active power by time

with(sub_power_data, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

## Close PNG file

dev.off()