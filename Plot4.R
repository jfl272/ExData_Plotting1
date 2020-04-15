
# Exploratory data analysis - Week 1 Assignment - Plot 3

# Libraries used in this program:

library(dplyr)
library(chron)

# First of all we load the data and filter the dates 1/2/2007 and 2/2/2007.

pc_data<-read.table("household_power_consumption.txt",sep = ";",header = T)
pc_data<-filter(pc_data,Date=="1/2/2007" | Date=="2/2/2007")


# We convert the Date and Time in date and time format

pc_data$Date<-as.Date(pc_data$Date, format="%d/%m/%Y")
pc_data$Time<-times(pc_data$Time)

# Define variables necessary for 

day_time<-with(pc_data, ymd(Date) + hms(Time))
pc_data$Global_active_power<-as.numeric(as.vector(pc_data$Global_active_power))
pc_data$Voltage<-as.numeric(as.vector(pc_data$Voltage))
pc_data$Global_reactive_power<-as.numeric(as.vector(pc_data$Global_reactive_power))

sub_met_1<-as.numeric(as.vector(pc_data$Sub_metering_1))
sub_met_2<-as.numeric(as.vector(pc_data$Sub_metering_2))
sub_met_3<-as.numeric(as.vector(pc_data$Sub_metering_3))

# we divide the image in 4 and plot the graphs:

par(mfrow=c(2,2))

plot(day_time,pc_data$Global_active_power,type="l", xlab="", 
     ylab = "Global Active Power" )

plot(day_time,pc_data$Voltage,type="l", xlab="datetime",
     ylab = "Voltage" )


plot(day_time,sub_met_1,type="l", xlab="",
     ylab = "Energy sub metering" )

lines(day_time,sub_met_2,type="l",col="red")

lines(day_time,sub_met_3,type="l",col="blue")

legend("topright",lty=1, col = c("black","red","blue"),cex = 0.5,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.5,bty = "n"
      ) 
       
plot(day_time,pc_data$Global_reactive_power,type="l",
    xlab="datetime",  ylab = "Global_reactive_power")

# Copying the plot to a png file and closing the png device

dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()