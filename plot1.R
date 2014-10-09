#read full file
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?") 

#replace full file with subset of the two days
epc <- epc[epc$Date=="1/2/2007" | epc$Date=="2/2/2007",]

#convert date and time
epc <- transform(epc,Date=as.Date(Date,format='%d/%m/%Y'),Time=strptime(paste(epc$Date,epc$Time),format='%d/%m/%Y%H:%M:%S'))

#open PNG device; create 'plot1.png' in the current working directory default size is 480x480
png(file = "plot1.png")  

## Create histogram and send to a file 
hist(epc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#close the PNG device 
dev.off()  
