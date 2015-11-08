#Data preparation steps
d <- grep("^(1/2/2007|2/2/2007)", readLines("household_power_consumption.txt"))
data <- read.table("household_power_consumption.txt",sep=";",skip=d[1]-1,nrows=d[length(d)]-d[1]+1)
nrow(data)
headers <- readLines("household_power_consumption.txt",n=1)
names(data) <- strsplit(headers, ";")[[1]]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Plotting the first plot
png(file="plot1.png")
hist(data$Global_active_power, main="Global Active Power", col="red", ylab="Frequency",xlab="Global Active Power (kilowatts)")
dev.off()