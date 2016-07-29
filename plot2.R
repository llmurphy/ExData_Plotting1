# ExData Assignment 1: Plot2

setwd("/Users/Murph/Desktop/coursera/ExData")

myData <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")

myData1 <- subset(myData,Date=="1/2/2007" | Date=="2/2/2007")

library(dplyr)
myData1 <- mutate(myData1,datetime=paste(myData1$Date,myData1$Time))
myData1$datetime <- strptime(myData1$datetime,"%d/%m/%Y %H:%M:%S")

myData1$Global_active_power <- as.numeric(as.character(myData1$Global_active_power))

png(filename = "plot2.png",width=480,height=480,units="px")

with(myData1, plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)",
     xlab="",type="l"))

dev.off()