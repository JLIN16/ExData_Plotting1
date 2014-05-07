#read in only the subset of data that we want
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, sep = ";",col.names = colnames(read.table(
  "household_power_consumption.txt",
  nrow = 1, header = TRUE, sep=";")))

#create new data+time column
datetime<-paste(hpc$Date,hpc$Time)
hpc$DateTime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")

#generate plot 4
#using white background instead of transparent for easier visualization in GitHub
png(filename = "plot4.png", width = 480, height = 480,units = "px", pointsize = 12, res = NA,
    restoreConsole = TRUE)
par(mfrow=c(2,2),mar=c(4.4, 3.75, 3.4, 1.4))
plot(hpc$DateTime,hpc$Global_active_power,type='l',ylab='Global Active Power',xlab='',lwd=1.2)
plot(hpc$DateTime,hpc$Voltage,type='l',ylab='Voltage',xlab='datetime',lwd=1.2)
with(hpc, plot(DateTime,Sub_metering_1,ylab='Energy sub metering',type = "l",col='black',xlab=''))
with(hpc, lines(DateTime,Sub_metering_2, col = "red"))
with(hpc, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright",col = c("black","red", "blue"),bty='n',lty=1,cex=0.9,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(hpc$DateTime,hpc$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime',lwd=1,yaxt='n')
axis(2,at=seq(0.0,0.5,0.1),cex.axis=0.85)
dev.off()
