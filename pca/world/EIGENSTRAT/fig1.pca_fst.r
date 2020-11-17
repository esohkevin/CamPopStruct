#!/usr/bin/env Rscript

#--Load packages
#library(RColorBrewer)
#coul <- colorRampPalette(brewer.pal(5, "YlOrRd"))(25)
require(colorspace)
require(gplots)
require(dplyr)
coul <- heat_hcl(29, c=c(90, 40), l=c(30, 90), power=c(1/5, 1.5))

#--Load Fst
fstMat <- read.table("fstMatrix0.05.txt", header=F, as.is=T)
fstMat2 <- fstMat %>% 
  mutate_at(vars(-V1), funs(./1000))
m <- as.matrix(fstMat2[,-c(1)])
rownames(m) <- fstMat2[,c(1)]
colnames(m) <- fstMat2[,c(1)]
#write.table(m, file = "fstMatrix0.05.txt", col.names=F, row.names=T,quote=F,sep="\t")

#--Load PCA
evecDat <- read.table("world-evecDat.txt", header=T, as.is=T)

#--Make plots

#fst
fst <- function() {
        distance = dist(m, method = "manhattan")
	cluster = hclust(distance, method = "ward.D")
	#heatmap.2(m, col = coul, density.info="none", trace="none", key.xlab=expression(F[ST]), key.title=NA)
        #jpeg("WorldHeat.jpeg", width = 7, height = 7, units = "in", res = 1200, pointsize = 12)
	heatmap.2(m, 
		  col = coul, 
		  density.info="none", 
		  trace="none", 
		  key.xlab=expression(F[ST]), 
		  key.title=NA, 
		  lmat = rbind(c(0,3),c(2,1),c(0,4)),
		  lwid = c(0.4,4), 
		  lhei = c(1,9,2), 
		  margins=c(2,8), 
		  key.par = list(mar= c(4, 1, 3, 9)),
		  Rowv=as.dendrogram(cluster), 
		  Colv=as.dendrogram(cluster),
		  #Colv=F
	)
	#dev.off()
}

#evec
ev <- function() {
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
}

#--PCA legend
legn <- function() { 
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
                             ncol=3, bty="n", cex=0.7)
}


#   #--Plot all
#   #jpeg("WorldHeatPCA.jpeg", width = 15, height = 10, units = "in", res = 1200, pointsize = 14)
#   pdf("WorldPCA_Heat.pdf", width = 15, height = 10, pointsize = 13, colormodel="cmyk", paper="A4")
#     layout.matrix <- matrix(c(1, 2), nrow = 1, ncol = 2)
#     layout(mat = layout.matrix)
#      par(fig=c(0,0.5,0,1), new=T)
#       plot.new()
#       fst()
#      par(fig=c(0.5,1,0.35,1), mar=c(4,4,2,1), new=T, bty="n", cex=0.9, cex.lab=0.8)
#       plot.new()
#       ev()
#      par(fig=c(0.5,1,0,0.40), mar=c(4,2,0,0), new=T, bty="l", cex=0.9)
#       plot.new()
#       legn()
#   dev.off()


#--Plot Fst
bitmap("WorldHeat.tiff", width = 7, height = 7, units = "in", res = 300, points=12)
#pdf("WorldHeat.pdf", width = 7, height = 7, pointsize = 13, colormodel="cmyk", paper="A4")
  fst()
dev.off()

#--Plot PCA
#jpeg("WorldPCA.jpeg", width = 7, height = 7, units = "in", res = 1200, pointsize = 12)
bitmap("WorldPCA.tiff", width = 7, height = 8, units = "in", res = 300, pointsize=14)
#pdf("WorldPCA.pdf", width = 6, height = 8, pointsize = 13, colormodel="cmyk", paper="A4")
   par(fig=c(0,1,0.35,1), mar=c(4,4,4,2), bty="n", cex=1, cex.lab=0.6, cex.axis=0.6)
    #plot.new()
    ev()
   par(fig=c(0,1,0,0.40), mar=c(4,3,0,0), new=T, bty="l", cex=0.8)
    plot.new()
    legn()
dev.off()

