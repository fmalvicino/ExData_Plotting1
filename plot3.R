hpc<- read.csv("household_power_consumption.txt", sep= ";", na.strings="?")

library(dplyr)
library(lubridate)

hpc$DateTime <- dmy_hms (paste(hpc$Date, hpc$Time))

hpc2 <- filter(hpc, DateTime %within% new_interval(ymd("2007-02-01"), ymd_hm("2007-02-02 23:59")))


plot(hpc2$DateTime, hpc2$Sub_metering_1, xlab= "", ylab="Energy sub metering", type="n")

legend("topright", lty = 1, col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

lines(hpc2$DateTime, hpc2$Sub_metering_1, type= "l")
lines(hpc2$DateTime, hpc2$Sub_metering_2, type= "l", col= "red")
lines(hpc2$DateTime, hpc2$Sub_metering_3, type= "l", col = "blue")

dev.copy(device = png, file= "plot3.png", width = 480, height = 480)
dev.off()
