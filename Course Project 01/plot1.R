# Make sure to run the code "setup.R" before running this code.

## plot1.png
png(filename = "Week 01/plot1.png")
with(power, hist(Global_active_power,
                 col = "red",
                 main = "Global Active Power",
                 xlab = "Global Active Power (kilowatts)"))
dev.off()