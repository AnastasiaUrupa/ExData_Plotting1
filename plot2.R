## Parameter wd is working directory - the directory where "household_
## power_consumption" file is situated.
plot2<-function(wd){
    setwd(wd)
    datacp1<-read.table("household_power_consumption.txt",header=FALSE, 
           sep=";",na.strings="?", skip=66637, nrows=2880)
    datacp1$V2=paste(datacp1$V1,datacp1$V2, sep="/")
    datacp1$V2<-strptime(datacp1$V2, format="%d/%m/%Y/%H:%M:%S")
    datacp1$V1<-as.Date(datacp1$V1, format="%d/%m/%Y")
    png("plot2.png")
    par(mar=c(2,4,4,1))
    plot(datacp1$V2, datacp1$V3, type="l", ylab="Global Active Power (kilowatts)")
    dev.off()
}