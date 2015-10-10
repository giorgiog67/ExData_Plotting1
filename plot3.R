powercomp <- read.csv(unzip(zipfile="exdata-data-household_power_consumption.zip"), sep=";",
                      na.strings = c("?"), stringsAsFactors = FALSE, header=TRUE)

filter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))

powercomp <- transform(powercomp, Date=as.Date(Date, format="%d/%m/%Y"))
powercomp.filt <- subset(powercomp, (Date >= filter[1] & Date <= filter[2]))

png("plot3.png")
wd <- c("Thu", "Fri", "Sat")
n <- nrow(powercomp.filt)
wd.pos <- c(1, n/2, n)
attach(powercomp.filt)
plot(Sub_metering_1, type='n', xlab ="",  ylab = "Energy sub metering", xaxt="n")
lines(Sub_metering_1, type='l', xlab ="", xaxt="n", col ='black')
lines(Sub_metering_2, type='l', xlab ="", xaxt="n", col ='red')
lines(Sub_metering_3, type='l', xlab ="", xaxt="n", col ='blue')
axis(1, at=wd.pos, labels=wd, las=1)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex=0.95)
detach(powercomp.filt)
dev.off()
