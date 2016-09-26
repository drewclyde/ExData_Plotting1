#Function to read data from file and construc

#load data as data frame using read.table
electric <- read.table("household_power_consumption.txt", sep = ";", 
                       header = TRUE, colClasses = "character", 
                       na.strings = "?")

#convert column 1 to a Date object
electric[,1] <- as.Date(electric[,1], format = "%d/%m/%Y")

#subset data to dates 2007-02-01 and 2007-02-02

interest <- subset(electric, Date == "2007-02-01" | 
                     Date == "2007-02-02")

#Conver Date and Time to a single Date object (for purposes of plotting)
interest$DT <- paste(interest$Date, interest$Time)

interest$DT <- strptime(interest$DT, format = "%Y-%m-%d %H:%M:%S")

#open plot file
png(filename = "plot3.png")

#plot histogram
plot(interest$DT, interest$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(interest$DT, interest$Sub_metering_2, col="red")
lines(interest$DT, interest$Sub_metering_3, col="blue")

legend("topright", c("meter_1", "meter_2", "meter_3"), lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

#close graphic device
dev.off()

