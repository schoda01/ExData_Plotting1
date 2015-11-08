#get data (assumes household_power_consumption.txt is saved in working directory)
#Note: there are 2880 obs. for the 1st or 2nd day of February 2007 starting at row 66638
hpc <- read.table("./household_power_consumption.txt",sep=";",header=FALSE, skip=66637, nrows=2880)

#extract global_active_power data (column 3)
gap <- hpc[,c(3)]
#clean up and remove hpc data.
rm(hpc)

#Open png device; create plot1.png (size is 480 x 480) in working directory
png(filename="plot1.png", width=480, height=480)

#create histogram with applicable labels, breaks, and colors
hist(gap, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#close the png device
dev.off()
