
# Exploratory data analysis - Week 1 Assignment - Plot 1

# Libraries used in this program:

library(dplyr)
library(chron)

# First of all we load the data and filter the dates 1/2/2007 and 2/2/2007.

pc_data<-read.table("household_power_consumption.txt",sep = ";",header = T)
pc_data<-filter(pc_data,Date=="1/2/2007" | Date=="2/2/2007")


# We convert the Date and Time in date and time format

pc_data$Date<-as.Date(pc_data$Date, format="%d/%m/%Y")
pc_data$Time<-times(pc_data$Time)

# Plotting of the histogram:

hist(as.numeric(as.character(pc_data$Global_active_power)), 
     main = "Global Active Power", xlab = "Global Active Power [kilowatts]", 
     col = "red")

# Copying the plot to a png file and closing the png device

dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()
