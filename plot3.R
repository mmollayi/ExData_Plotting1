library(dplyr)
hpc <- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  colClasses = c("character", "character", rep("numeric", 7)),
                  na.strings = "?")

hpc1 <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")  %>%
        mutate(DateTime = paste(Date, Time)) %>%
        mutate(DateTime = as.POSIXct(strptime(DateTime, "%d/%m/%Y %H:%M:%S")))

png(filename="plot3.png", width=480, height=480)
plot(hpc1$DateTime,  
     hpc1$Sub_metering_1,
     ylab = "Energy sub metering", 
     xlab = "", 
     main = "",
     type = "l")

lines(hpc1$DateTime, hpc1$Sub_metering_2, col="red")
lines(hpc1$DateTime, hpc1$Sub_metering_3, col="blue")
legend("topright", 
       lwd = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off() 