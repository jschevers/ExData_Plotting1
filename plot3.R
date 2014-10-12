## Exploratory Data Analysis, Course Project 1
## Date: "2014-10-11"
## code for plot3
zipfile="household_power_consumption.zip"  # downloaded zipped file
datfile="household_power_consumption.txt"  # unzipped file
datfile_project="hpc_project1.csv"         # file containing data for making the plots

## download the data, unzip, read, make selection and write (once) 
if (!file.exists(datfile_project))
{if (!file.exists(datfile))
{if (!file.exists(zipfile))
{url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
 download.file(url,zipfile,method="auto")
}
unzip(zipfile)
}
dat_total=read.table(datfile,header=TRUE,sep=";", na.strings = "?")
dat_sel=dat_total[dat_total$Date %in% c("1/2/2007", "2/2/2007") ,]
write.csv(dat_sel,datfile_project,row.names=FALSE)
}

## read the data
dat=read.csv(datfile_project)          # file containing data for making the plots
Sys.setlocale("LC_TIME", "English")    # Set notation to English
dat$DateTime=strptime(paste(dat$Date, dat$Time),format="%d/%m/%Y %H:%M:%S" ) 

## plot3
png(file="plot3.png",width = 480, height = 480)
  par(mfrow=c(1,1))
  with(dat,{plot(DateTime,Sub_metering_1 ,type="l",xlab="",ylab="Energy sub metering",col="black")
          points(DateTime,Sub_metering_2 ,type="l",col="red")
          points(DateTime,Sub_metering_3 ,type="l",xlab="",col="blue")
          }
     )
  legend("topright", lwd=2 , col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
