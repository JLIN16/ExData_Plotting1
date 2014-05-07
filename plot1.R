#read in only the subset of data that we want
hpc <- read.table("household_power_consumption.txt",skip = 66637, nrow = 2880, sep = ";",col.names = colnames(read.table(
  "household_power_consumption.txt",
  nrow = 1, header = TRUE, sep=";")))

#create new data+time column
datetime<-paste(hpc$Date,hpc$Time)
hpc$DateTime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")

#generate plot 1
png(filename = "plot1.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "transparent", res = NA,
    restoreConsole = TRUE)
par(mar=c(4.3,3.8,2.6,1.5))
hist(hpc$Global_active_power, col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()