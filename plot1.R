## plot1.R - Plots a histogram of of household power use

## Read in the data, subset out the two days we want (1 - 2 Feb 2007) and convert power to numeric

power_data <- read.table("data/household_power_consumption.txt", sep = ';', header = TRUE)
sub_power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
sub_power_data$Global_active_power = as.numeric(sub_power_data$Global_active_power)

## Open our PNG file for output

png("plot1.png")

## Set parameters for single plot

par(mfrow = c(1, 1))

## Plot histogram with red columns and custom main title and x-axis label

hist(sub_power_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Close the PNG file 

dev.off()