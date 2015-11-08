#get data (assumes household_power_consumption.txt is saved in working directory)
#Note: there are 2880 obs. for the 1st or 2nd day of February 2007 starting at row 66638
hpc <- read.table("./household_power_consumption.txt",sep=";",header=FALSE, skip=66637, nrows=2880)

#extract date, time, global_active_power data (columns 1,2,3)
dat <- subset(hpc, select=c(1,2,3))
#Add column headers
names(dat) <- c("date","time","global_active_power")
#create new datetime column from values of date and time columns
dat$datetime <- strptime(paste(dat$date, dat$time), "%d/%m/%Y %H:%M:%S")

#clean up and remove hpc data.
rm(hpc)

#Open png device; create plot2.png (size is 480 x 480) in working directory
png(filename="plot2.png", width=480, height=480)

#create plot
plot(dat$datetime, dat$global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

#close the png device
dev.off()
