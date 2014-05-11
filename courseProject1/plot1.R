plot1<-function() {
  #Requisites:
  #   **Install sqldf package** using install.packages("sqldf");  
  library(sqldf)  
  #Read data
  expdata<-read.csv.sql("household_power_consumption.txt",sql="select * from file where date in ('1/2/2007','2/2/2007') ",sep=";",eol="\n");
  #Create device
  png(file = "plot1.png", bg = "transparent", width=504, height=504);
  #Create histogram
  hist(expdata$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)");
  #Write plot to png file
  dev.off();
  print("Plot created, please verify plot1.png");

}