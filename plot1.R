hpc<- read.csv("household_power_consumption.txt", sep= ";", na.strings="?")

library(dplyr)
library(lubridate)


hpc$Date <- as.Date(strptime(hpc$Date, format = "%d/%m/%Y"))

hpc2<- filter(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(hpc2$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power")

png (file = "plot1.png", width = 480, height = 480)

hist(hpc2$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power")

dev.off()
