## PLOT 1
setwd("~/Data_Science_Course") #setting working directory

#Reading the data
library(readr)
household_pc<- read_delim("./Data/household_power_consumption.txt", 
                          ";", escape_double = FALSE, col_types = cols(Time = col_character()), 
                          trim_ws = TRUE)

#Transforming 'Date' column in a date format variable
household_pc$Date<-as.Date(strptime(household_pc$Date, format="%d/%m/%Y"))
household_pc<-subset(household_pc, Date=="2007-02-01" | Date=="2007-02-02")

#Generating and saving Plot
hist(household_pc$Global_active_power, main="Global Active Power" , xlab = "Global Active Power (kilowatts)",col = "red")
dev.copy(png,file="plot1.png")
dev.off()