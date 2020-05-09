data1 <-read.table("~/Downloads/Coursera_exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

data2= subset(data1[66637:69516, ])

data2$Date <- as.Date(data2$Date,"%d/%m/%Y")

data2<-cbind(data2, "DateTime" = as.POSIXct(paste(data2$Date, data2$Time)))

par(mar = c(4,4,2,2), mfrow=c(2,2))

with(data2, plot(DateTime, Global_active_power, type= "l", xlab = "", ylab = "Global Active Power"))

with(data2, plot(DateTime, Voltage, type= "l", xlab = "datetime", ylab = "Voltage"))

with(data2, {plot(DateTime, Sub_metering_1, type="l", xlab="", ylab= "Energy sub metering")})
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

with(data2, plot(DateTime, Global_reactive_power, type= "l", xlab = "datetime", ylab = "Global_reactive_power"))

dev.copy(png, file= "plot4.png")
dev.off()


