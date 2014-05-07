#read in only the subset of data that we want
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, sep = ";",col.names = colnames(read.table(
  "household_power_consumption.txt",
  nrow = 1, header = TRUE, sep=";")))

#create new data+time column
datetime<-paste(hpc$Date,hpc$Time)
hpc$DateTime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")

#generate plot 2
png(filename = "plot2.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "transparent", res = NA,
    restoreConsole = TRUE)
par(mar=c(4.4,3.88,3.1,1.2))
plot(hpc$DateTime,hpc$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='',lwd=1.2)
dev.off()