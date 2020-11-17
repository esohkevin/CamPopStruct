#!/usr/bin/env Rscript




evecDat <- read.table("afr.newdata.pca.txt", header=T, as.is=T)
camEvecDat <- read.table("cam.evecDat.txt", header=T, as.is=T)
#bitmap("AfrPCA.tiff", type="tiff32nc", height=6, width=7, units="in", points=12, res=300)
pdf("AfrPCA.pdf", paper = "special", colormodel="cmyk", width = 8, height = 6, pointsize = 12)
par(mfrow=c(2,1), cex=0.8, cex.axis=1, cex.lab=1.2)
par(fig=c(0,0.55,0.2,1), bty="n", mar=c(6,4,7,2))
plot(evecDat[,2], evecDat[,3], xlab="PC1 (Africa-only)", ylab="PC2", type="n", cex.axis=0.7, cex.lab=0.8)
for(i in 1:nrow(evecDat)){
if(evecDat[i,13]=='BA') points(evecDat[i,2], evecDat[i,3], col="green", pch=20)
if(evecDat[i,13]=='SB') points(evecDat[i,2], evecDat[i,3], col="blue", pch=20)
if(evecDat[i,13]=='FO') points(evecDat[i,2], evecDat[i,3], col="red", pch=20)
if(evecDat[i,13]=='ESN') points(evecDat[i,2], evecDat[i,3], col="darkorchid3", pch=20)
if(evecDat[i,13]=='YRI') points(evecDat[i,2], evecDat[i,3], col="darkorchid4", pch=20)
if(evecDat[i,13]=='MSL') points(evecDat[i,2], evecDat[i,3], col="deepskyblue", pch=20)
if(evecDat[i,13]=='GWD') points(evecDat[i,2], evecDat[i,3], col="aquamarine4", pch=20)
if(evecDat[i,13]=='LWK') points(evecDat[i,2], evecDat[i,3], col="goldenrod2", pch=20)
}
par(fig=c(0,0.55,0,0.4), new=T, bty="o", mar=c(2,2,3,1))
plot.new()
legend("center", c("BA=BANTU","SB=SEMI-BANTU","FO=FULBE",
                   "ESN=ESAN in Nigeria","YRI=Yoruba in Ibadan, Nigeria",
                   "MSL=Mende in Sierra Leone", "GWD=Gambian Mandinka", "LWK=Luhya in Webuye, Kenya"),
                   col=c("green","blue", "red","darkorchid3","darkorchid4",
                   "deepskyblue","aquamarine4","goldenrod2"),
       pch=c(20,20,20,20,20,20,20,20),
                   ncol=2, bty="n", cex=0.8)

  par(fig=c(0.55,1,0.48,1), new=T, bty="o", mar=c(4,4,2,2), cex=0.8, cex.lab=0.8, cex.axis=0.7)
  plot.new()
  plot(camEvecDat$C1,camEvecDat$C2, pch=20, xlab="PC1", ylab="PC2", type="n")
  for(i in 1:nrow(camEvecDat)){
     if(camEvecDat[i,13]=='BA') points(camEvecDat[i,2], camEvecDat[i,3], col="green", pch=20)
     if(camEvecDat[i,13]=='SB') points(camEvecDat[i,2], camEvecDat[i,3], col="blue", pch=20)
     if(camEvecDat[i,13]=='FO') points(camEvecDat[i,2], camEvecDat[i,3], col="red", pch=20)
  }
  legend("topright", c("BA","SB","FO"), col=c("green","blue","red"), pch=20, cex=0.7, bty="n")

  par(fig=c(0.55,1,0,0.55), new=T, bty="o", mar=c(4,4,3,2), cex=0.8, cex.lab=0.8, cex.axis=0.7)
  plot.new()
  plot(camEvecDat$C1,camEvecDat$C3, pch=20, xlab="PC1", ylab="PC3", type="n")
  for(i in 1:nrow(camEvecDat)){
     if(camEvecDat[i,13]=='BA') points(camEvecDat[i,2], camEvecDat[i,4], col="green", pch=20)
     if(camEvecDat[i,13]=='SB') points(camEvecDat[i,2], camEvecDat[i,4], col="blue", pch=20)
     if(camEvecDat[i,13]=='FO') points(camEvecDat[i,2], camEvecDat[i,4], col="red", pch=20)
  }
  legend("topleft", c("BA","SB","FO"), col=c("green","blue","red"), pch=20, cex=0.7, bty="n")


dev.off()


