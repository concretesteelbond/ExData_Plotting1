data1 <-read.table("~/Downloads/Coursera_exploratory_data_analysis/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

data2= subset(data1[66637:69516, ])

data2$Date <- as.Date(data2$Date,"%d/%m/%Y")

data2<-cbind(data2, "DateTime" = as.POSIXct(paste(data2$Date, data2$Time)))

with(data2, {plot(DateTime, Sub_metering_1, type="l", xlab="", ylab= "Energy sub metering")})
lines(data2$DateTime, data2$Sub_metering_2, col = "red")
lines(data2$DateTime, data2$Sub_metering_3, col = "blue")
legend("topright", lty = 1, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

dev.copy(png, file= "plot3.png")
dev.off()

