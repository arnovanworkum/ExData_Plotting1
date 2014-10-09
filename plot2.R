#read full file
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?") 

#replace full file with subset of the two days
epc <- epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#convert date and time
epc <- transform(epc,Date=as.Date(Date,format='%d/%m/%Y'),Time=strptime(paste(epc$Date,epc$Time),format='%d/%m/%Y%H:%M:%S'))

#open PNG device; create 'plot2.png' in the current working directory default size is 480x480
png(file = "plot2.png")  

## Create line diagram and send to a file 
plot(epc$Time,epc$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(epc$Time,epc$Global_active_power)

#close the PNG device 
dev.off()  
