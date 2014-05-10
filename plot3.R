plot3<-function(){
  #sets language to C (North-America)
  Sys.setlocale(category = "LC_ALL", locale = "C")
  
  data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
  
  #sort day 1 and 2 of February 2007
  sorted.data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"), ] 
  
  #extract numbers to plot
  submet1<-as.numeric(as.vector(sorted.data$Sub_metering_1))
  submet2<-as.numeric(as.vector(sorted.data$Sub_metering_2))
  submet3<-as.numeric(as.vector(sorted.data$Sub_metering_3))
  
  #extract dates
  days<-strptime(paste(sorted.data$Date, sorted.data$Time), format="%d/%m/%Y %H:%M:%S")
  
  #plot
  png(filename = "plot3.png", width = 480, height = 480)   
  plot(days, submet1, type="l", xlab="", ylab="Energy sub metering")
  lines(days, submet2, col="red")
  lines(days, submet3, col="blue")
  legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.font=1, lwd=c(2.5,2.5), lty=1)
     
  #save PNG file
  
  dev.off()
}