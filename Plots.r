###********************************************
## This file is for generating the correspoding 
## plots from the information generated in the 
## file Script.r
## All the plots are exported in format jpeg
##********************************************
## Here the the time series are plotted
jpeg("Series.jpg",width = 640, height = 480)
plot(OilCompanies[,1],OilCompanies[,2],type="l",col=1,ylim=c(0,200),lwd=3,
     xlab="Date",ylab="Price",cex.lab=1.5,cex.axis=1.5)
lines(OilCompanies[,1],OilCompanies[,3],col=2,lwd=3)
lines(OilCompanies[,1],OilCompanies[,4],col=3,lwd=3)
lines(OilCompanies[,1],OilCompanies[,5],col=4,lwd=3)
lines(OilCompanies[,1],OilCompanies[,6],col=5,lwd=3)
lines(OilCompanies[,1],OilCompanies[,7],col=6,lwd=3)
lines(OilCompanies[,1],OilCompanies[,8],col=7,lwd=3)
legend("topleft",legend=c("CVX","PBR","AQM","EC","MRO","XOM","Shell"),col=1:7,
       lty=c(1,1,1,1,1,1,1),lwd=c(3,3,3,3,3,3,3))
dev.off()
## Time series fo the variables
jpeg("Variables.jpg",width = 640, height = 480)
plot(OilCompanies[,1],OilCompanies[,9],type="l",col=2,ylim=c(60,120),lwd=3,
     xlab="Date",ylab="Price",cex.lab=1.5,cex.axis=1.5)
lines(OilCompanies[,1],OilCompanies[,10],type="l",col=3,lwd=3)
lines(OilCompanies[,1],OilCompanies[,11],type="l",col=4,lwd=3)
legend("topleft",legend=c("NYICDX","Brent","CLW"),col=2:4,lty=c(1,1,1),lwd=c(3,3,3))
dev.off()
##**************************************************
## Data distribution 
## Boxplot of the data is generated, all the 
## columns are plotted in the same figure
jpeg("Boxplot.jpg",width = 640, height = 480)
par(las = 3)
boxplot(OilCompanies[,2:8],col=2:8,ylab="Price")
dev.off()
##**********************************************************
## The histrogram
## The histrograms are plotted individually
## The function par() allows all the plots to be in the same figure
jpeg("Histrogram.jpg",width = 640, height = 480)
par(mfrow = c(3,3))
hist(OilCompanies[,2],breaks=10,col=2,main="CVX",xlab="Price",cex.lab=1.5)
hist(OilCompanies[,3],breaks=10,col=3,main="PBR",xlab="Price",cex.lab=1.5)
hist(OilCompanies[,4],breaks=10,col=4,main="AQM",xlab="Price",cex.lab=1.5)
hist(OilCompanies[,5],breaks=10,col=5,main="EC",xlab="Price",cex.lab=1.5)
hist(OilCompanies[,6],breaks=10,col=6,main="MRO",xlab="Price",cex.lab=1.5)
hist(OilCompanies[,7],breaks=10,col=7,main="XON",xlab="Price",cex.lab=1.5)
hist(OilCompanies[,8],breaks=10,col=8,main="SHELL",xlab="Price",cex.lab=1.5)
dev.off()
##***********************************************************
## The Correlation plot
## Just using the function plot over the matrix excluding th date.
jpeg("Corplot.jpg",width = 768, height = 576)
plot(OilCompanies[,2:11],cex.lab=1.5,pch="*",cex.axis=1.2)
dev.off()
###**************************************************************
## The Mobiles stats are plotted in this section 
## All these data are plotted individually in the same figure
## That is achieved using the function par()
####################
## The mobile standard deviation
jpeg("SD.jpg",width = 640, height = 480)
par(mfrow = c(3,3))
plot(Deviation[,1],type="l",col=2,main="CVX",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,2],type="l",col=3,main="PBR",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,3],type="l",col=4,main="AQM",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,4],type="l",col=5,main="EC",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,5],type="l",col=6,main="MRO",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,6],type="l",col=7,main="XON",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,7],type="l",col=8,main="SHELL",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,8],type="l",col=9,main="Dolar",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
plot(Deviation[,9],type="l",col=10,main="Brent",xlab="time",cex.lab=1.5,ylab="SD",lwd=3)
dev.off()
##########
## The mobile
jpeg("Mean.jpg",width = 640, height = 480)
par(mfrow = c(3,3))
plot(MeanOil[,1],type="l",col=2,main="CVX",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,2],type="l",col=3,main="PBR",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,3],type="l",col=4,main="AQM",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,4],type="l",col=5,main="EC",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,5],type="l",col=6,main="MRO",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,6],type="l",col=7,main="XON",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,7],type="l",col=8,main="SHELL",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,8],type="l",col=9,main="Dolar",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
plot(MeanOil[,9],type="l",col=10,main="Brent",xlab="time",cex.lab=1.5,ylab="Mean",lwd=3)
dev.off()
##############################################
## The FFT is plotted
## Every FFT is plotted individual in the same
## figure using the funtion par()
jpeg("FFT.jpg",width = 640, height = 480)
par(mfrow = c(3,3))
plot.frequency.spectrum(Fourier[2:30,1])
plot.frequency.spectrum(Fourier[2:30,2])
plot.frequency.spectrum(Fourier[2:30,3])
plot.frequency.spectrum(Fourier[2:30,4])
plot.frequency.spectrum(Fourier[2:30,5])
plot.frequency.spectrum(Fourier[2:30,6])
plot.frequency.spectrum(Fourier[2:30,7])
plot.frequency.spectrum(Fourier[2:30,8])
plot.frequency.spectrum(Fourier[2:30,9])
dev.off()
################################################################
## AUTOCORRELATION
### The autocorrelation is done usig the function ACF
## This function generates a plot that contains relevant information
## regarding the critical values. Hence, different plot are 
## generated using a loop, and plotted in the same figure using the function
## par()
Names.oil=c("CVX","PBR","AQM","EC","MRO","XON","SHELL","Dollar","Brent","WTI")
jpeg("AutoCor.jpg",width = 640, height = 480)
par(mfrow = c(3,3))
j=1
while(j<=9){
  Jalisco<-acf(OilCompanies[,j+1],plot=FALSE)
  plot(Jalisco,main =Names.oil[j], xlab = "Lag", ylab = "Autocorrelation")
  j=j+1
}
dev.off()
#############################################
###ARIMA
## The arima is done using the arima function from the
## package forecast. This function generates a plot contains
## the prediction with the corresponding condifence interval.
## Hence, different plots are generated using a loop, and plotted
## in the same figure using the function par() 
jpeg("ARIMA.jpg",width = 640, height = 480)
par(mfrow = c(3,3))
j=1
while(j<=9){
  fit<-auto.arima(OilCompanies[200:251,j+1])
  Jalisco<-forecast(fit,h=10)
  plot(Jalisco,main =Names.oil[j], xlab = "time", ylab = "Price",)
  j=j+1
}
dev.off()
#dev.off()
