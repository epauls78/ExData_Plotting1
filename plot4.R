plot4<-function(){
  #sets language to C (North-America)
  Sys.setlocale(category = "LC_ALL", locale = "C")
  
  data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
  
  #sort day 1 and 2 of February 2007
  sorted.data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"), ] 
  
  #extract numbers to plot
  submet1<-as.numeric(as.vector(sorted.data$Sub_metering_1))
  submet2<-as.numeric(as.vector(sorted.data$Sub_metering_2))
  submet3<-as.numeric(as.vector(sorted.data$Sub_metering_3))
  Powernumeric<-as.numeric(as.vector(sorted.data$Global_active_power))
  voltage<-as.numeric(as.vector(sorted.data$Voltage))
  Globalreactive<-as.numeric(as.vector(sorted.data$Global_reactive_power))
  
  #extract dates
  days<-strptime(paste(sorted.data$Date, sorted.data$Time), format="%d/%m/%Y %H:%M:%S")
  
  png(filename = "plot4.png", width = 480, height = 480)
  
  #plot
  par(mfrow= c(2,2))
  
  #number1
  plot(days, Powernumeric, type="l", xlab="", ylab="Global Active Power")
  #number2
  plot(days, voltage, type="l", xlab="datetime", ylab="Voltage")
  
  #number3
  plot(days, submet1, type="l", xlab="", ylab="Energy sub metering")
  lines(days, submet2, col="red")
  lines(days, submet3, col="blue")
  legend("topright", cex=0.9, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.font=1, lwd=c(2.5,2.5), lty=1)
  #number4
  plot(days, Globalreactive, type="l", xlab="datetime", ylab="Global_reactive_power", yaxt="n")
  axis(2, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))
  
  #save PNG file
  
  dev.off()
}