## PLOT 4
setwd("~/Data_Science_Course") #setting working directory

#Reading the data
library(readr)
household_pc<- read_delim("./Data/household_power_consumption.txt", 
                          ";", escape_double = FALSE, col_types = cols(Time = col_character()), 
                          trim_ws = TRUE)

#Transforming 'Date' column in a date format variable
household_pc$Date<-as.Date(strptime(household_pc$Date, format="%d/%m/%Y"))
household_pc<-subset(household_pc, Date=="2007-02-01" | Date=="2007-02-02")

#Creating the 'Date_time' variable
household_pc$Date_time<-paste(household_pc$Date, household_pc$Time, sep = " ")
household_pc$Date_time<-strptime(household_pc$Date_time, "%Y-%m-%d %H:%M:%S")

#Generating and saving Plot
par(mfrow=c(2,2), mar=c(5,5,3,2))
with(household_pc, plot(Date_time,Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
                        xlab=""))

with(household_pc, plot(Date_time,Voltage, type="l", xlab = "datetime",ylab = "Voltage"))

with(household_pc, plot(Date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(household_pc, lines(Date_time, Sub_metering_2, type="l", col="red"))
with(household_pc, lines(Date_time, Sub_metering_3, type="l", col="blue"))
legend("topright", pch = "-", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2",
                                                                        "Sub_metering_3"), pt.cex = 2)

with(household_pc, plot(Date_time,Global_reactive_power, type="l", xlab = "datetime",
                        ylab = "Global_reactive_power"))
dev.copy(png,file="plot4.png")
dev.off()
