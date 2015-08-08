hpc<- read.csv("household_power_consumption.txt", sep= ";", na.strings="?")

library(dplyr)
library(lubridate)

hpc$DateTime <- dmy_hms (paste(hpc$Date, hpc$Time))

hpc2 <- filter(hpc, DateTime %within% new_interval(ymd("2007-02-01"), ymd_hm("2007-02-02 23:59")))

plot(hpc2$DateTime, hpc2$Global_active_power, xlab= "", ylab="Global Active Power (kilowatts)", type="l")

png (file = "plot2.png", width = 480, height = 480)

plot(hpc2$DateTime, hpc2$Global_active_power, xlab= "", ylab="Global Active Power (kilowatts)", type="l")


dev.off()