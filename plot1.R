plot1<-function(){
  data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
  
  #sort day 1 and 2 of February 2007
  sorted.data<-data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"), ] 
  
  #extract numbers to plot
  Globalpower<-as.vector(sorted.data$Global_active_power)
  Powernumeric<-as.numeric(Globalpower)
  
  #build plot
  hist(Powernumeric, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  #save PNG
  dev.copy(png, file ="plot1.png")
  dev.off()
}