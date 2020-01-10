## PLOT 2
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
with(household_pc, plot(Date_time,Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
                        xlab=""))
dev.copy(png,file="plot2.png")
dev.off()