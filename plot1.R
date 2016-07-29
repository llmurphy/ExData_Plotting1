# ExData Assignment 1: Plot1

setwd("/Users/Murph/Desktop/coursera/ExData")

myData <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")

myData1 <- subset(myData,Date=="1/2/2007" | Date=="2/2/2007")

myData1$Global_active_power <- as.numeric(as.character(myData1$Global_active_power))

png(filename = "plot1.png",width=480,height=480,units="px")

plot1 <- hist(myData1$Global_active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",col = "red")

dev.off()