#Data preparation steps
d <- grep("^(1/2/2007|2/2/2007)", readLines("household_power_consumption.txt"))
data <- read.table("household_power_consumption.txt",sep=";",skip=d[1]-1,nrows=d[length(d)]-d[1]+1)
nrow(data)
headers <- readLines("household_power_consumption.txt",n=1)
names(data) <- strsplit(headers, ";")[[1]]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Plotting the third plot
png(file="plot3.png")
plot(data$DateTime, data$Sub_metering_1,type="n",lwd=1,xlab="",ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"), lwd=1)
dev.off()