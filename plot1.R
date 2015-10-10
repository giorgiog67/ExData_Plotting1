powercomp <- read.csv(unzip(zipfile="exdata-data-household_power_consumption.zip"), sep=";",
                   na.strings = c("?"), stringsAsFactors = FALSE, header=TRUE)

filter <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))

powercomp <- transform(powercomp, Date=as.Date(Date, format="%d/%m/%Y"))
powercomp.filt <- subset(powercomp, (Date >= filter[1] & Date <= filter[2]))

png("plot1.png")
with(powercomp.filt, hist(Global_active_power, col="red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
