#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

if (length(args) < 1) {
  print("",quote=F)
  print("Usage: ./plotCV.R [in_log]",quote=F)
  print("",quote=F)
  print("in_log: Logfile containing CV values and their indexes",quote=F)
  print("",quote=F)
   quit(save="no")
} else {
   inlog <- args[1]
   outimg <- gsub(".txt",".png",inlog)
   
   cv <- read.table(inlog, header=T, as.is=T)
   png(outimg, height=14, width=14, res=100, units="cm", points=12)
   plot(cv, xlab="K", ylab="Cross-validation error", pch = 20,  type="b")
   dev.off()
}
