library(dplyr)
hpc <- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  colClasses = c("character", "character", rep("numeric", 7)),
                  na.strings = "?")

hpc1 <- filter(hpc, Date == "1/2/2007" | Date == "2/2/2007")  %>%
        mutate(DateTime = paste(Date, Time)) %>%
        mutate(DateTime = as.POSIXct(strptime(DateTime, "%d/%m/%Y %H:%M:%S")))

png(filename="plot1.png", width=480, height=480)
hist(hpc1$Global_active_power,  
     col="red",  
     xlab="Global Active Power (kilowatts)",  
     main="Global Active Power")
dev.off() 