setwd("C:/Users/Carlos Chirino/Documents/exdata_data_household_power_consumption")
power <- read.table("household_power_consumption.txt",sep=";", header = T,na="?", colClasses = c("character",'character','numeric','numeric','numeric','numeric','numeric','numeric','numeric') )
power <- power[which(power$Date == '2/2/2007' | power$Date=='1/2/2007'),]
power$POSIX <-as.POSIXlt.character(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")
hist(power$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
png(filename="plot1_v1.png",width=480, height=480)
dev.off()
