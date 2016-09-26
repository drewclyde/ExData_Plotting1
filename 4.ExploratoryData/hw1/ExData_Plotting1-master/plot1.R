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

#convert variable of interest to numeric
interest$Global_active_power <- as.numeric(interest$Global_active_power)

#open plot file
png(filename = "plot1.png")

#plot histogram
hist(interest$Global_active_power, breaks = 12, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#close graphic device
dev.off()

