#read full file
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?") 

#replace full file with subset of the two days
epc <- epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#convert date and time
epc <- transform(epc,Date=as.Date(Date,format='%d/%m/%Y'),Time=strptime(paste(epc$Date,epc$Time),format='%d/%m/%Y%H:%M:%S'))

#open PNG device; create 'plot3.png' in the current working directory default size is 480x480
png(file = "plot3.png")  

#create line diagram and send to a file 
plot(epc$Time,epc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(epc$Time,epc$Sub_metering_1,col="black")
lines(epc$Time,epc$Sub_metering_2,col="red")
lines(epc$Time,epc$Sub_metering_3,col="blue")

#Create legend in the top right corner
legend("topright", col = c("black","red","blue"), lty=c(1,1,1),lwd=c(1,1,1), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#close the PNG device 
dev.off()  
