#read full file
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?") 

#replace full file with subset of the two days
epc <- epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#convert date and time
epc <- transform(epc,Date=as.Date(Date,format='%d/%m/%Y'),Time=strptime(paste(epc$Date,epc$Time),format='%d/%m/%Y%H:%M:%S'))

#open PNG device; create 'plot4.png' in the current working directory default size is 480x480
png(file = "plot4.png")  

#set the right canvas for 4 graphs
par(mfrow = c(2, 2)) 

## Create line diagram and send to a file 
plot(epc$Time,epc$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(epc$Time,epc$Global_active_power)

plot(epc$Time,epc$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(epc$Time,epc$Voltage)

plot(epc$Time,epc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(epc$Time,epc$Sub_metering_1,col="black")
lines(epc$Time,epc$Sub_metering_2,col="red")
lines(epc$Time,epc$Sub_metering_3,col="blue")

plot(epc$Time,epc$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(epc$Time,epc$Global_reactive_power)

#close the PNG device 
dev.off()  

