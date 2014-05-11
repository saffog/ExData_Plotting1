plot3<-function() {
  #Requisites:
  #   **Install sqldf package** using install.packages("sqldf");  
  library(sqldf)  
  #Read data
  expdata<-read.csv.sql("household_power_consumption.txt",sql="select * from file where date in ('1/2/2007','2/2/2007') ",sep=";",eol="\n");
  #Get timeline data
  timedata<-strptime(paste(expdata$Date,expdata$Time),format="%d/%m/%Y %H:%M:%S");
  #Create plot
  png(file = "plot3.png", bg = "transparent", width=504, height=504);
  plot(timedata,expdata$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"); 
  points(timedata,expdata$Sub_metering_2,type="l",col="red");
  points(timedata,expdata$Sub_metering_3,type="l",col="blue");
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
  dev.off();
  print("Plot created, please verify plot3.png");
  
}