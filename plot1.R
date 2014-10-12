## Exploratory Data Analysis, Course Project 1
## Date: "2014-10-11"
## code for plot1
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

## plot1
png(file="plot1.png",width = 480, height = 480) 
with(dat,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()