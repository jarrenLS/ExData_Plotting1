# Make sure to run the code "setup.R" before running this code.

## plot3.png
png(filename = "Week 01/plot3.png")
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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()