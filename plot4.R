powercomp <- read.csv(unzip(zipfile="exdata-data-household_power_consumption.zip"), sep=";",
                      na.strings = c("?"), stringsAsFactors = FALSE, header=TRUE)

filter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))

powercomp <- transform(powercomp, Date=as.Date(Date, format="%d/%m/%Y"))
powercomp.filt <- subset(powercomp, (Date >= filter[1] & Date <= filter[2]))

png("plot4.png")
attach(powercomp.filt)
par(mfrow=c(2,2))
wd <- c("Thu", "Fri", "Sat")
n <- nrow(powercomp.filt)
wd.pos <- c(1, n/2, n)

# plot at position (1,1)
plot(Global_active_power, type='l', xlab ="", ylab = "Global Active Power", xaxt="n")
axis(1, at=wd.pos, labels=wd, las=1)

# plot at position (1,2)
plot(Voltage, type='l', xlab ="datetime", ylab = "Voltage", xaxt="n")
axis(1, at=wd.pos, labels=wd, las=1)

# plot at position (2,1)
plot(Sub_metering_1, type='n', xlab ="", ylab = "Energy sub metering", xaxt="n")
lines(Sub_metering_1, type='l', xlab ="", xaxt="n", col ='black')
lines(Sub_metering_2, type='l', xlab ="", xaxt="n", col ='red')
lines(Sub_metering_3, type='l', xlab ="", xaxt="n", col ='blue')
axis(1, at=wd.pos, labels=wd, las=1)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex=0.9, bty="n")

# plot at position (2,2)
plot(Global_reactive_power, type='l', xlab ="datetime", xaxt="n")
axis(1, at=wd.pos, labels=wd, las=1)

detach(powercomp.filt)
dev.off()