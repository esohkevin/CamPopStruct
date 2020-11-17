#!/usr/bin/env Rscript

library("colorspace")

evecDat <- read.table("world-evecDat.txt", header=T, as.is=T)
#pdf("WorldPCA.pdf", colormodel="cmyk", pointsize=18, paper="a4")
jpeg("WorldPCA.jpeg", width = 5, height = 5, units = "in", res = 1200, pointsize = 12)
par(mfrow=c(2,1), cex=0.6, cex.axis=0.8, cex.lab=0.8)
par(fig=c(0,1,0.30,1), bty="n", mar=c(4,5,2,2))
plot(evecDat[,2], evecDat[,3], xlab="PC1", ylab="PC2", type="n")
for(i in 1:nrow(evecDat)){
if(evecDat[i,13]=='BA') points(evecDat[i,2], evecDat[i,3], col="deeppink", pch=20)
if(evecDat[i,13]=='SB') points(evecDat[i,2], evecDat[i,3], col="deeppink", pch=20)
if(evecDat[i,13]=='FO') points(evecDat[i,2], evecDat[i,3], col="deeppink", pch=20)
if(evecDat[i,13]=='ESN') points(evecDat[i,2], evecDat[i,3], col="deeppink1", pch=20)
if(evecDat[i,13]=='YRI') points(evecDat[i,2], evecDat[i,3], col="deeppink1", pch=20)
if(evecDat[i,13]=='MSL') points(evecDat[i,2], evecDat[i,3], col="deeppink2", pch=20)
if(evecDat[i,13]=='GWD') points(evecDat[i,2], evecDat[i,3], col="deeppink3", pch=20)
if(evecDat[i,13]=='LWK') points(evecDat[i,2], evecDat[i,3], col="deeppink1", pch=20)
if(evecDat[i,13]=='ACB') points(evecDat[i,2], evecDat[i,3], col="deeppink4", pch=20)
if(evecDat[i,13]=='ASW') points(evecDat[i,2], evecDat[i,3], col="deeppink4", pch=20)
if(evecDat[i,13]=='CLM') points(evecDat[i,2], evecDat[i,3], col="gray54", pch=20)
if(evecDat[i,13]=='MXL') points(evecDat[i,2], evecDat[i,3], col="gray53", pch=20)
if(evecDat[i,13]=='PEL') points(evecDat[i,2], evecDat[i,3], col="gray52", pch=20)
if(evecDat[i,13]=='PUR') points(evecDat[i,2], evecDat[i,3], col="gray51", pch=20)
if(evecDat[i,13]=='CEU') points(evecDat[i,2], evecDat[i,3], col="chartreuse", pch=20)
if(evecDat[i,13]=='FIN') points(evecDat[i,2], evecDat[i,3], col="chartreuse1", pch=20)
if(evecDat[i,13]=='GBR') points(evecDat[i,2], evecDat[i,3], col="chartreuse2", pch=20)
if(evecDat[i,13]=='IBS') points(evecDat[i,2], evecDat[i,3], col="chartreuse3", pch=20)
if(evecDat[i,13]=='TSI') points(evecDat[i,2], evecDat[i,3], col="chartreuse4", pch=20)
if(evecDat[i,13]=='BEB') points(evecDat[i,2], evecDat[i,3], col="royalblue", pch=20)
if(evecDat[i,13]=='GIH') points(evecDat[i,2], evecDat[i,3], col="royalblue1", pch=20)
if(evecDat[i,13]=='ITU') points(evecDat[i,2], evecDat[i,3], col="royalblue2", pch=20)
if(evecDat[i,13]=='PJL') points(evecDat[i,2], evecDat[i,3], col="royalblue3", pch=20)
if(evecDat[i,13]=='STU') points(evecDat[i,2], evecDat[i,3], col="royalblue4", pch=20)
if(evecDat[i,13]=='CDX') points(evecDat[i,2], evecDat[i,3], col="goldenrod", pch=20)
if(evecDat[i,13]=='CHB') points(evecDat[i,2], evecDat[i,3], col="goldenrod1", pch=20)
if(evecDat[i,13]=='CHS') points(evecDat[i,2], evecDat[i,3], col="goldenrod2", pch=20)
if(evecDat[i,13]=='JPT') points(evecDat[i,2], evecDat[i,3], col="goldenrod3", pch=20)
if(evecDat[i,13]=='KHV') points(evecDat[i,2], evecDat[i,3], col="goldenrod4", pch=20)
}
par(fig=c(0,1,0,0.40), new=T, bty="l", mar=c(0,3,1,1))
plot.new()
legend("center", c("BA=BANTU","SB=SEMI-BANTU","FO=FULBE","ESN=ESAN in Nigeria","YRI=Yoruba in Ibadan, Nigeria",
                   "MSL=Mende in Sierra Leone", "GWD=Gambian Mandinka", "LWK=Luhya in Webuye, Kenya",
		   "ACB=African Caribbean in Barbados", "ASW=African-American SW",
                   "CLM=Colombian", "MXL=Mexican-American", "PEL=Peruvian", "PUR=Puerto Rican",
                   "CEU=CEPH", "FIN=Finnish", "GBR=British in England and Scotland",
                   "IBS=Iberian populations in Spain", "TSI=Toscani in Italy","", "BEB=Bengali in Bangladesh",
                   "GIH=Gujarati Indian in Houston, TX", "ITU=Indian Telugu in the UK",
                   "PJL=Punjabi in Lahore, Pakistan", "STU=Sri Lankan Tamil in the UK",
                   "CDX=Dai Chinese", "CHB=Han Chinese", "CHS=Southern Han Chinese", "JPT=Japanese",
                   "KHV=Kinh Vietnamese"),
                col=c("deeppink", "deeppink","deeppink","deeppink1","deeppink1",
                   "deeppink2", "deeppink2","deeppink3","deeppink4","deeppink4","gray54","gray53",
                   "gray52","gray51","chartreuse","chartreuse1", "chartreuse2","chartreuse3",
                   "chartreuse4","white","royalblue","royalblue1","royalblue2","royalblue3","royalblue4",
                   "goldenrod","goldenrod1", "goldenrod2","goldenrod3","goldenrod4"),
                pch=c(20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,1,20,20,20,20,20,20,20,20,20,20),
                ncol=3, bty="n", cex=0.8)
dev.off()


#     bmp(filename = "Rplot%03d.bmp",
#         width = 480, height = 480, units = "px", pointsize = 12,
#         bg = "white", res = NA, ...,
#         type = c("cairo", "Xlib", "quartz"), antialias)
#
#     jpeg(filename = "Rplot%03d.jpeg",
#          width = 480, height = 480, units = "px", pointsize = 12,
#          quality = 75,
#          bg = "white", res = NA, ...,
#          type = c("cairo", "Xlib", "quartz"), antialias)
#
#     png(filename = "Rplot%03d.png",
#         width = 480, height = 480, units = "px", pointsize = 12,
#          bg = "white",  res = NA, ...,
#         type = c("cairo", "cairo-png", "Xlib", "quartz"), antialias)
#
#     tiff(filename = "Rplot%03d.tiff",
#          width = 480, height = 480, units = "px", pointsize = 12,
#          compression = c("none", "rle", "lzw", "jpeg", "zip", "lzw+p", "zip+p"),
#          bg = "white", res = NA,  ...,
#          type = c("cairo", "Xlib", "quartz"), antialias)
