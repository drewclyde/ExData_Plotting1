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

#convert variable of interest to numeric
interest$Global_active_power <- as.numeric(interest$Global_active_power)

#open plot file
png(filename = "plot2.png")

#plot histogram
plot(interest$DT, interest$Global_active_power, type = "l", ylab = "Global active power", xlab = "")

#close graphic device
dev.off()

