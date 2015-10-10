powercomp <- read.csv(unzip(zipfile="exdata-data-household_power_consumption.zip"), sep=";",
                      na.strings = c("?"), stringsAsFactors = FALSE, header=TRUE)

filter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))

powercomp <- transform(powercomp, Date=as.Date(Date, format="%d/%m/%Y"))
powercomp.filt <- subset(powercomp, (Date >= filter[1] & Date <= filter[2]))

png("plot2.png")
wd <- c("Thu", "Fri", "Sat")
n <- nrow(powercomp.filt)
wd.pos <- c(1, n/2, n)
with(powercomp.filt, plot(Global_active_power, type='l', xlab ="", 
     ylab = "Global Active Power (kilowatts)", xaxt="n"))
axis(1, at=wd.pos, labels=wd, las=1)
dev.off()
