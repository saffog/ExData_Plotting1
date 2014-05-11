plot2<-function() {
  #Requisites:
  #   **Install sqldf package** using install.packages("sqldf");  
  library(sqldf)  
  #Read data
  expdata<-read.csv.sql("household_power_consumption.txt",sql="select * from file where date in ('1/2/2007','2/2/2007') ",sep=";",eol="\n");
  #Get timeline data
  timedata<-strptime(paste(expdata$Date,expdata$Time),format="%d/%m/%Y %H:%M:%S");
  #Create device
  png(file = "plot2.png", bg = "transparent", width=504, height=504);
  #Create plot
  plot(timedata,expdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)");
  #Write plot to png file
  dev.off();
  print("Plot created, please verify plot2.png");
  
}