## Parameter wd is working directory - the directory where "household_
## power_consumption" file is situated.
plot1<-function(wd){
    setwd(wd)
    datacp1<-read.table("household_power_consumption.txt",header=FALSE, 
        sep=";",na.strings="?", skip=66637, nrows=2880)
    datacp1$V1<-as.Date(datacp1$V1, format="%d/%m/%Y")
    png("plot1.png")
    hist(datacp1$V3, breaks=12, col="red", xlab="Global Active Power (kilowatts)",
        main="Global Active Power")
    dev.off()
}
