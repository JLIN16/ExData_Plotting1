#read in only the subset of data that we want
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, sep = ";",col.names = colnames(read.table(
  "household_power_consumption.txt",
  nrow = 1, header = TRUE, sep=";")))

#create new data+time column
datetime<-paste(hpc$Date,hpc$Time)
hpc$DateTime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")

#generate plot 3
#using white background instead of transparent for easier visualization in GitHub
png(filename = "plot3.png", width = 480, height = 480,units = "px", pointsize = 12, res = NA,
    restoreConsole = TRUE)
par(mar=c(4.2,3.8,3.1,1.2))
with(hpc, plot(DateTime,Sub_metering_1,ylab='Energy sub metering',type = "l",col='black',xlab=''))
with(hpc, lines(DateTime,Sub_metering_2, col = "red"))
with(hpc, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright",col = c("black","red", "blue"),lty=1,legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
