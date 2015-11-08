#get data (assumes household_power_consumption.txt is saved in working directory)
#Note: there are 2880 obs. for the 1st or 2nd day of February 2007 starting at row 66638
hpc <- read.table("./household_power_consumption.txt",sep=";",header=FALSE, skip=66637, nrows=2880)

#Add column headers
names(hpc) <- c("date","time","global_active_power","global_reactive_power","voltage","global_intensity","sub_metering_1","sub_metering_2","sub_metering_3")
#create new datetime column from values of date and time columns
hpc$datetime <- strptime(paste(hpc$date, hpc$time), "%d/%m/%Y %H:%M:%S")

#Open png device; create plot4.png (size is 480 x 480) in working directory
png(filename="plot4.png", width=480, height=480)
#set as 2x2 grid to hold 4 plots
par(mfrow=c(2,2))

#create upper left plot (same as plot 2)
plot(hpc$datetime, hpc$global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

#create upper right plot
plot(hpc$datetime, hpc$voltage, ylab="voltage", xlab="datetime", type="l")

#create bottom left plot (same as plot 3)
#create plot using first sub metering value
plot(hpc$datetime, hpc$sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
#add line for second sub metering value
lines(hpc$datetime, hpc$sub_metering_2, col="red")
#add line for third sub metering value
lines(hpc$datetime, hpc$sub_metering_3, col="blue")
#add legend
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, bty="n")

#create bottom right plot
plot(hpc$datetime, hpc$global_reactive_power, ylab="global_reactive_power", xlab="datetime", type="l")

#close the png device
dev.off()
