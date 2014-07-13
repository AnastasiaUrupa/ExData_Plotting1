## Parameter wd is working directory - the directory where "household_
## power_consumption" file is situated.
plot3<-function(wd){
    setwd(wd)
    datacp1<-read.table("household_power_consumption.txt",header=FALSE, 
          sep=";",na.strings="?", skip=66637, nrows=2880)
    datacp1$V2=paste(datacp1$V1,datacp1$V2, sep="/")
    datacp1$V2<-strptime(datacp1$V2, format="%d/%m/%Y/%H:%M:%S")
    datacp1$V1<-as.Date(datacp1$V1, format="%d/%m/%Y")
    png("plot3.png")
    par(mar=c(2,4,5,1))
    plot(datacp1$V2, datacp1$V7, type="l", ylab="Energy sub metering")
    lines(datacp1$V2, datacp1$V8, type="l", col="red")
    lines(datacp1$V2, datacp1$V9, type="l", col="blue")
    legend("topright", col=c("black", "red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1)
    dev.off()
      
}