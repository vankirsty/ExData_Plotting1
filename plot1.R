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

#Plot 1
hist(edc$Global_active_power,main='Global Active Power',col='red',xlab='Global Active Power (kilowatts)')

#copy plot to file
dev.copy(png,file='plot1.png')
dev.off()


