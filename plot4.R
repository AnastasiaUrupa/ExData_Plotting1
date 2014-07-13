## Parameter wd is working directory - the directory where "household_
## power_consumption" file is situated.
plot4<-function(wd){
    setwd(wd)
    datacp1<-read.table("household_power_consumption.txt",header=FALSE, 
                        sep=";",na.strings="?", skip=66637, nrows=2880)
    datacp1$V2=paste(datacp1$V1,datacp1$V2, sep="/")
    datacp1$V2<-strptime(datacp1$V2, format="%d/%m/%Y/%H:%M:%S")
    datacp1$V1<-as.Date(datacp1$V1, format="%d/%m/%Y")
    png("plot4.png")
    par(mar=c(4,4,5,2), mfrow=c(2,2))
    plot(datacp1$V2, datacp1$V3, type="l", ylab="Global Active Power", xlab="")
    plot(datacp1$V2, datacp1$V5, type="l", ylab="Voltage", xlab="datetime")
    plot(datacp1$V2, datacp1$V7, type="l", ylab="Energy sub metering", xlab="")
    lines(datacp1$V2, datacp1$V8, type="l", col="red")
    lines(datacp1$V2, datacp1$V9, type="l", col="blue")
    legend("topright", col=c("black", "red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
           lty=1, bty="n")
    plot(datacp1$V2, datacp1$V4, type="l", ylab="Global_reactive_power", 
         xlab="datetime")
    dev.off()
  
}