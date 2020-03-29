#!/usr/bin/env Rscript

#setwd("~/esohdata/GWAS/popstruct/admixture/")

args <- commandArgs(TRUE)
if (length(args) < 1) {
   print("", quote=F)
   print("Usage ./plotQ_all.R [Q_estimate]", quote=F)
   print("", quote=F)
   quit(save="no")
} else {
     require(colorspace)
     fn <- args[1]
     outimg <- gsub(".Q",".png",fn)
     
     #--- Load files
     tbl=read.table(fn)
     n <- ncol(tbl)
     pcol <- RColorBrewer::brewer.pal(n, "Dark2")
     #pcol <- rainbow(n)
     #pcol <- qualitative_hcl(n, "Dark2")
     png(outimg, height=8, width=10, units="cm", res=200, type = "cairo")
     #par(mfrow=c(2,1), mar=c(4,4,1,1))
     par(fig=c(0,1,0,1))
     barplot(t(as.matrix(tbl)), col=pcol[1:n], 
             ylab="Ancestry", border=NA, space=0,
             main = "Model-based clustering",
             cex.main=0.8)
     #par(fig=c(0,1,0,0.65), new=T)
     dev.off()
}
