plot2<-function(){
  #sets language to C (North-America)
  Sys.setlocale(category = "LC_ALL", locale = "C")
  
  data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
  
  #sort day 1 and 2 of February 2007
  sorted.data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"), ] 
  
  #extract numbers to plot
  Globalpower<-as.vector(sorted.data$Global_active_power)
  Powernumeric<-as.numeric(Globalpower)
  
  #extract dates
  days<-strptime(paste(sorted.data$Date, sorted.data$Time), format="%d/%m/%Y %H:%M:%S")
  
  #plot
   plot(days, Powernumeric, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  #save PNG file
  dev.copy(png, file ="plot2.png")
  dev.off()
}