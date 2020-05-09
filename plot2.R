data1 <-read.table("~/Downloads/Coursera_exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

data2= subset(data1[66637:69516, ])

data2$Date <- as.Date(data2$Date,"%d/%m/%Y")

data2<-cbind(data2, "DateTime" = as.POSIXct(paste(data2$Date, data2$Time)))

with(data2, plot(DateTime, Global_active_power, type= "l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file= "plot2.png")
dev.off()



