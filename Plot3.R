data<-read.table("household_power_consumption.txt",sep = ";", header = TRUE)
data <- subset(data,data$Date=="1/2/2007" |data$Date =="2/2/2007")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,2] <- format(data[1:1440,2],"2007-02-01 %H:%M:%S")
data[1441:2880,2] <- format(data[1441:2880,2],"2007-02-02 %H:%M:%S")

plot(data$Time,data$Sub_metering_1,type="n",xlab="",
     ylab="Energy sub metering")

with(data,lines(Time,as.numeric(Sub_metering_1)))
with(data,lines(Time,as.numeric(Sub_metering_2),col="red"))
with(data,lines(Time,as.numeric(Sub_metering_3),col="blue"))

legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))





