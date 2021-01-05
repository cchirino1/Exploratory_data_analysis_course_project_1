# once the file is downloaded, I configure the path
setwd("C:/Users/Carlos Chirino/Documents/exdata_data_household_power_consumption")
#Read, name and subdivide power consumption data
electric_power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(electric_power) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
sub_electric_power <- subset(electric_power, electric_power$date=="1/2/2007" | electric_power$date=="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
sub_electric_power$date <- as.Date(sub_electric_power$date, format="%d/%m/%Y")
sub_electric_power$time <- strptime(sub_electric_power$time, format = "%H:%M:%S")
sub_electric_power[1:1440,"time"] <- format(sub_electric_power[1:1440,"time"],"2007-02-01 %H:%M:%S")
sub_electric_power[1441:2880,"time"] <- format(sub_electric_power[1441:2880,"time"],"2007-02-02 %H:%M:%S")

# calling the basic plot function
plot(sub_electric_power$time,as.numeric(as.character(sub_electric_power$global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# chart title
title(main="Global Active Power Vs Time")

#change path to save image in main repository
setwd("C:/Users/Carlos Chirino/Desktop/R/Coursera/Course Project 1/Exploratory_data_analysis_course_project_1")
#copying to png
dev.copy(png, filename="plot2.png")
dev.off()