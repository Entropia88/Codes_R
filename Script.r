##
#Script for anazlizing the stock market 
#This script is made for analyzing the time serie of the stock market
###########
####Loading the libraries
library(stats)      #library for basic stats
library(forecast)   #library for ARMA and ARIMA
###********************************************
###Read files
## The files should be separated by comma, the first column should
## be the date, the second column the price of the stock, and the first
## should correspond to the library.
## The files are loading individually.
PetroBras<-read.table("PetroBras",sep=",",header=TRUE)
Algoquin<-read.table("Algoquin",sep=",",header=TRUE) ##**
Chevron<-read.table("Chevron",sep=",",header=TRUE)
Ecopetrol<-read.table("Ecopetrol",sep=",",header=TRUE)
Marathon<-read.table("Marathon_Oil_Corporation",sep=",",header=TRUE)
Exxon<-read.table("Exxon",sep=",",header=TRUE)
Shell<-read.table("Shell",sep=",",header=TRUE)
#*************************
Dollar<-read.table("Dollar",sep=",",header=TRUE)
Brent<-read.table("Brent",sep=",",header=TRUE)
CLW00<-read.table("CLW00",sep=",",header=TRUE)
##############
## Separting the date format
date.time<-paste(PetroBras[,1])
#####################
## Converting into numerical values, but only
## the second column that contains the prices and 
## indexes.
PetroBras<-as.matrix(PetroBras[,2])
Algoquin<-as.matrix(Algoquin[,2])
Chevron<-as.matrix(Chevron[,2])
Ecopetrol<-as.matrix(Ecopetrol[,2])
Marathon<-as.matrix(Marathon[,2])
Exxon<-as.matrix(Exxon[,2])
Shell<-as.matrix(Shell[,2])
#**************
Dollar<-as.matrix(Dollar[,2])
Brent<-as.matrix(Brent[,2])
CLW00<-as.matrix(CLW00[,2])
###########################
## Converting into Date format
## In this case the date is in the format dd/mm/YYYY
date.time<-strptime(date.time,format='%d/%m/%Y',tz="GMT")
################################
## Compile everything
## All is in a single matrix
OilCompanies<-data.frame(date=date.time,Chevron,PetroBras,Algoquin,Ecopetrol,Marathon,
                         Exxon,Shell,Dollar,Brent,CLW00)
###################################
## This is done for having the information individually.
PetroBras<-data.frame(date=date.time,PetroBras)
Algoquin<-data.frame(date=date.time,Algoquin)
Chevron<-data.frame(date=date.time,Chevron)
Ecopetrol<-data.frame(date=date.time,Ecopetrol)
Marathon<-data.frame(date=date.time,Marathon)
Exxon<-data.frame(date=date.time,Exxon)
Shell<-data.frame(date=date.time,Shell)
##**********************************************
## Analysis section
## Most of the analysis is done in this section
#*Correlation analysis
cor(OilCompanies[,2:11])
#########
n<-length(OilCompanies[,2])      #number of rows
m<-(length(OilCompanies[1,])-1)  #number of columns - column of date
Deviation<-matrix(ncol=m,nrow=n) #matrix for SD
MeanOil<-matrix(ncol=m,nrow=n)   #matrix for Mean
Fourier<-matrix(ncol=m,nrow=n)   #matrix for FFT
####
# The mobile SD and mean are created
j=1
while(j<=m){
  i=1
  Fourier[,j]<-fft(OilCompanies[,j+1]) #FFT for each company
  while(i<=(n-10)){
    Deviation[i,j]<-sd(OilCompanies[i:(i+10),j+1])
    MeanOil[i,j]<-mean(OilCompanies[i:(i+10),j+1])
    i=i+1
  }
  j=j+1
}
#########
##*** Create the time series with a lag
i=1
False_NB<-rep(0,n)
while(i<=(n-5)){
False_NB[i]<-Chevron[i+4,2]
i=i+1
}

##****
## The following lines correspond to the plot obtained
## after a frequency analysis is done
plot.frequency.spectrum <- function(X.k, xlimits=c(0,length(X.k))) {
  plot.data  <- cbind(0:(length(X.k)-1), Mod(X.k))

  # TODO: why this scaling is necessary?
  plot.data[2:length(X.k),2] <- 2*plot.data[2:length(X.k),2] 
  
  plot(plot.data, t="h", lwd=2, main="", 
       xlab="Frequency (Hz)", ylab="Strength", 
       xlim=xlimits, ylim=c(0,max(Mod(plot.data[,2]))))
}
