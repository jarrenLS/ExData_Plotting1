# Make sure to run the code "setup.R" before running this code.

## plot4.png
png(filename = "Week 01/plot4.png")
par(mfrow = c(2, 2))
with(power, plot(Date.Time, Global_active_power,
                 type = "l",
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
with(power, plot(Date.Time, Voltage,
                 type = "l",
                 xlab = "datetime",
                 ylab = "Voltage"))
with(power, plot(Date.Time, Sub_metering_1, 
                 type = "n",
                 xlab = "",
                 ylab = "Energy sub metering"))
with(power, lines(Date.Time, Sub_metering_1))
with(power, lines(Date.Time, Sub_metering_2,
                  col = "red"))
with(power, lines(Date.Time, Sub_metering_3,
                  col = "blue"))
legend("topright", 
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
with(power, plot(Date.Time, Global_reactive_power,
                 type = "l",
                 xlab = "datetime",
                 ylab = "Global_reactive_power"))
dev.off()
