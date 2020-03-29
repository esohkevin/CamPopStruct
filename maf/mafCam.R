#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

if (length(args) < 5 ) {
   print("",quote=F)
   print("Usage: ./mafStats.R [ maf_file] [out_prefix] [threads] [daf|maf] [binsize]",quote=F)
   print("",quote=F)
   print("maf_file: File with three columns with PLINK freq-type header [SNP CLST MAF]",quote=F)
   print("(col1=snpid/rsid, col2=PopName, col3=MAF)",quote=F)
   print("daf|maf: State whether to run DAF or MAF. Enter 'daf' or 'maf' accordingly",quote=F)
   print("",quote=F)
   quit(save="no")
} else {
   
     if(!require(ggplot2)){
	     install.packages("ggplot2", repo="https.cloud.r-project.org")
     }
     if(!require(data.table)){
             install.packages("data.table", repo="https.cloud.r-project.org")
     }
     if(!require(colorspace)){
             install.packages("colorspace", repo="https.cloud.r-project.org")
     }
     if(!require(RColorBrewer)){
             install.packages("RColorBrewer", repo="https.cloud.r-project.org")
     }
     require(data.table)
     require(colorspace)
     require(RColorBrewer)
     
     f <- args[1]
     fout <- paste0(args[2],".txt")
     fimage <- paste0(args[2],".png")
     thr <- as.numeric(args[3])
     resp <- args[4]
     binsize <- as.numeric(args[5])
     frq <- fread(f,h=T,nThread=thr)

     print(paste0("Maximum ", resp, ": ", max(frq$MAF)), quote=F)
     print(paste0("Minimum ", resp, ": ", min(frq$MAF)), quote=F)
     #bin <- c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 1)
     bin <- seq(from=0.00, to=1, by=binsize)
     frqbins <- as.data.frame(bin)
     pops <- unique(frq$CLST)
     print(paste0("# Populations: ", length(pops)), quote=F)
     n <- length(pops)
     #pcol <- RColorBrewer::brewer.pal(n, "Set1")
     pcol <- c("green","red","blue")
     if (resp == "daf") {
        for (popindex in 1:n) {
           vc <- c()
           for(bindex in 1:length(bin)) {
                vc[bindex] <- (length(unique(frq$SNP[frq$MAF >= bin[bindex] & 
					     frq$MAF < bin[(bindex+1)] & 
					     frq$CLST == pops[popindex]]))/length(unique(frq$SNP[frq$CLST==pops[popindex]]))) #[frq$CLST==pops[popindex]]
           }
   	        frqbins[,pops[popindex]] <- vc
        }
     }
     else if (resp == "maf") {
             #bin <- c(0.05, 0.10, 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50)
	     bin <- seq(from=0.00, to=0.5, by=binsize)
             frqbins <- as.data.frame(bin)
             for (popindex in 1:n) {
		vc <- c()
                for(bindex in 1:length(bin)) {
                     vc[bindex] <- (length(unique(frq$SNP[frq$MAF >= bin[bindex] & 
                                             frq$MAF < bin[(bindex+1)] & 
                                             frq$CLST == pops[popindex]]))/length(unique(frq$SNP[frq$CLST==pops[popindex]]))) #[frq$CLST==pops[popindex]]
                }
                     frqbins[,pops[popindex]] <- vc
             }

     } else {
          print("",quote)
          print("Please enter either 'daf' or 'maf' as arqument 4!",quote)
          print("",quote)
          quit(save="no")
     }
     write.table(frqbins, file=fout,col.name=T, row.name=F, sep="\t",quote=F)

     #-- Get max xlim
     #xmax <- max(frq$MAF)
     xmax <- max(frqbins$bin)

     #-- Get max and min ylim
     frqs <- frqbins[,-c(1)]
     yma <- as.data.frame(c(0,0))
     ymi <- as.data.frame(c(1,1))
     for (ydx in 1:ncol(frqs)) {
             yma[ydx] <- max(frqs[ydx]) 
             ymi[ydx] <- min(frqs[ydx])
             ymax <- as.numeric(max(yma))
             ymin <- as.numeric(max(ymi))
     }

     print(paste0("Min x-value: ", "x-axis will start at '0'"), quote=F) 
     print(paste0("Max x-value: ", xmax), quote=F)     
     print(paste0("Min y-value: ", ymin), quote=F)
     print(paste0("Max y-value: ", ymax), quote=F)
     print(paste0("Frqbins #col: ", ncol(frqbins)), quote=F)

     #-- Plot
     png(fimage, height=10, width=10, units="cm", res=200, points=8)
     plot(0, 0, xlim=c(0,as.numeric(xmax)), ylim=c(0,ymax),
          type="n",xlab=paste0(resp, " bin"), ylab="Proportion of SNPs",
          main=paste0(resp, " spectrum"))
     frqs <- frqbins[,-c(1)]
     for (indx in 1:ncol(frqs)) {
	     print(paste0("Plotting ", pops[indx]), quote=F)
             frqplot = data.frame(c(frqbins[1], frqs[indx])) #data.frame(c(f[1],f[2]))
	     if (names(frqplot[2]) != "SB") {
                lines(frqplot, col=pcol[indx], type="s", lwd=1, lty=1)
	     }
	     else { lines(frqplot, col=pcol[indx], type="s", lwd=1, lty=2) }
     }
     legend("topright", legend=pops, col=pcol[1:ncol(frqs)], lty=c(1,1,2), lwd=1, bty="n") #legend=as.factor(names(frqbins[,-c(1)]))
     dev.off()
}
