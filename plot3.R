# ExData Assignment 1: Plot3

setwd("/Users/Murph/Desktop/coursera/ExData")

myData <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")

myData1 <- subset(myData,Date=="1/2/2007" | Date=="2/2/2007")

library(dplyr)
myData1 <- mutate(myData1,datetime=paste(myData1$Date,myData1$Time))
myData1$datetime <- strptime(myData1$datetime,"%d/%m/%Y %H:%M:%S")

myData1$Sub_metering_1 <- as.numeric(as.character(myData1$Sub_metering_1))
myData1$Sub_metering_2 <- as.numeric(as.character(myData1$Sub_metering_2))
myData1$Sub_metering_3 <- as.numeric(as.character(myData1$Sub_metering_3))

png(filename = "plot3.png",width=480,height=480,units="px")

with(myData1, plot(datetime, Sub_metering_1, ylab = "Energy sub metering",
     xlab="",type="l"))
with(myData1, plot(datetime, points(datetime, Sub_metering_2, col="red",type="l")))
with(myData1, plot(datetime, points(datetime, Sub_metering_3, col="blue",type="l")))
legend("topright",lwd=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()