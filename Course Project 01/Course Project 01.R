### Set the working directory to use files as necessary. ###

# Dataset can be obtained at the following website: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption



### Before loading the data in, consider the following: ###

## Consideration #01:
# * The dataset has 2,075,259 rows and 9 columns. First
# calculate a rough estimate of how much memory the dataset will require
# in memory before reading into R. Make sure your computer has enough
# memory (most modern computers should be fine).

# 2075259 rows; 9 columns; data is of different classes, but let's assume all 
# are numeric
2075259 * 9 * 8     # 8 bytes per numeric
# You obtain 149418648 bytes.  Let's convert it to something more manageable.
(149418648 / (2^20)) / 1000  # 2^20 bytes per MB

# You obtain ~142 MB (142.4967 MB).  My computer can handle that.


## Consideration #02: 
# * We will only be using data from the dates 2007-02-01 and
# 2007-02-02. One alternative is to read the data from just those dates
# rather than reading in the entire dataset and subsetting to those
# dates.

# I looked online for ways to read in just part of a dataset using only the 
# base package, but I had no luck.  I'll just do it the hard way.

# Reading the entire dataset in and subsetting to the dates specified.
power <- read.table("Week 01/household_power_consumption.txt", 
                    header = TRUE, 
                    sep = ";", 
                    na.strings = "?")
# By default, dates are formatted as dd/mm/yyyy; if date or month is single-
# digit, then the 0 is omitted
    # ex. February 01, 2007 is listed as "1/2/2007" instead of "01/02/2007"
power1 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")


## Consideration #03: 
# * You may find it useful to convert the Date and Time variables to
# Date/Time classes in R using the `strptime()` and `as.Date()`
# functions.

power1$Date.Time <- paste(power1$Date, power1$Time, sep = " ")
power1$Date.Time <- strptime(power1$Date.Time, "%d/%m/%Y %H:%M:%S")

# Tried using `as.Date()`, but doing so took the timestamp off, so I'm only
# using strptime instead.


## Consideration #04: 
# * Note that in this dataset missing values are coded as `?`.

# Because the missing values are coded as `?`, I read in the dataset and used 
# the na.strings argument to specify that NA values are represented by `?`.


# power1 is the subset we want to use, which means we can remove power.
rm(power)
# Additionally, let's rename power1 to power.
power <- power1
rm(power1)



### Creating Exploratory Graphs ###

# By default, R sets bitmap formats to 480 x 480 pixels.

## plot1.png
png(filename = "Week 01/plot1.png")
with(power, hist(Global_active_power,
                 col = "red",
                 main = "Global Active Power",
                 xlab = "Global Active Power (kilowatts)"))
dev.off()

## plot2.png
png(filename = "Week 01/plot2.png")
with(power, plot(Date.Time, Global_active_power,
                 type = "l",
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)"))
dev.off()

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
