# once the file is downloaded, I configure the path
setwd("C:/Users/Carlos Chirino/Documents/exdata_data_household_power_consumption")
#Read, name and subdivide power consumption data
electric_power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(electric_power) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
sub_electric_power <- subset(electric_power, electric_power$Date=="1/2/2007" | electric_power$Date=="2/2/2007")
#calling the basic plot function
hist(as.numeric(as.character(electric_power$global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
# chart title
title(main="Global Active Power")
#change path to save image in main repository
setwd("C:/Users/Carlos Chirino/Desktop/R/Coursera/Exploratory_data_analysis_course_project_1")
#copying to png
dev.copy(png, filename="plot1.png")
dev.off()