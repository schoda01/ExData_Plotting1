#get data (assumes household_power_consumption.txt is saved in working directory)
#Note: there are 2880 obs. for the 1st or 2nd day of February 2007 starting at row 66638
hpc <- read.table("./household_power_consumption.txt",sep=";",header=FALSE, skip=66637, nrows=2880)

#extract date, time, and submetering data (columns 1,2,7,8,9)
dat <- subset(hpc, select=c(1,2,7,8,9))
#Add column headers
names(dat) <- c("date","time","sub_metering_1","sub_metering_2","sub_metering_3")
#create new datetime column from values of date and time columns
dat$datetime <- strptime(paste(dat$date, dat$time), "%d/%m/%Y %H:%M:%S")

#clean up and remove hpc data.
rm(hpc)

#Open png device; create plot3.png (size is 480 x 480) in working directory
png(filename="plot3.png", width=480, height=480)

#create plot using first sub metering value
plot(dat$datetime, dat$sub_metering_1, col="black", ylab="Energy sub metering", xlab="", type="l")
#add line for second sub metering value
lines(dat$datetime, dat$sub_metering_2, col="red")
#add line for third sub metering value
lines(dat$datetime, dat$sub_metering_3, col="blue")
#add legend
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

#close the png device
dev.off()
