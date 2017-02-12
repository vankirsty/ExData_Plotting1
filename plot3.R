#Set Working Directory
setwd("C:\\Users\\piliv\\Documents\\GitHub\\datasciencecoursera\\datasciencecoursera\\ExData_Plotting1")

#Load Data
tempdat<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",tempdat)
edcdat<-read.table(unz(tempdat,"household_power_consumption.txt"),sep=";",header=TRUE,na.strings="?")


#Subset Data and Transform
edcdat$Time<-strptime(paste(edcdat$Date,edcdat$Time),"%d/%m/%Y %H:%M:%S")
edcdat$Date<-as.Date(edcdat$Date,format = "%d/%m/%Y")


edc<-subset(edcdat,Date >='2007-02-01'& Date <='2007-02-02')

edc$Global_active_power<-as.numeric(edc$Global_active_power)
edc$Global_reactive_power<-as.numeric(edc$Global_reactive_power)
edc$Voltage<-as.numeric(edc$Voltage)
edc$Global_intensity<-as.numeric(edc$Global_intensity)
edc$Global_active_power<-as.numeric(edc$Global_active_power)
edc$Sub_metering_1

#Plot 3

with(edc,plot(Time,Sub_metering_1, type='n',ylab='Energy sub metering', xlab=''))
lines(edc$Time,edc$Sub_metering_1,type='l',col="black")
lines(edc$Time,edc$Sub_metering_2,type='l',col="red")
lines(edc$Time,edc$Sub_metering_3,type='l',col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),cex=0.75)

#copy plot to file
dev.copy(png,file='plot3.png')
dev.off()


