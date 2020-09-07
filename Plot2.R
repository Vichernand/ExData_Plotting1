data<-read.table("household_power_consumption.txt",sep = ";", header = TRUE)
data <- subset(data,data$Date=="1/2/2007" |data$Date =="2/2/2007")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,2] <- format(data[1:1440,2],"2007-02-01 %H:%M:%S")
data[1441:2880,2] <- format(data[1441:2880,2],"2007-02-02 %H:%M:%S")

plot(data$Time,as.numeric(data$Global_active_power),type="l",xlab="",
     ylab="Global Active Power (kilowatts)") 
