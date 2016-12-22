# Make sure to run the code "setup.R" before running this code.

## plot2.png
png(filename = "Week 01/plot2.png")
with(power, plot(Date.Time, Global_active_power,
                 type = "l",
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
dev.off()