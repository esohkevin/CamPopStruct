#!/usr/bin/Rscript

require(data.table)

args <- commandArgs(TRUE)

ethnicity <- args[1]
bedprefix <- args[2]
#pe <- paste0(bedprefix, ".ped")
#ma <- paste0(bedprefix, ".map")
famname <- paste0(bedprefix, ".fam")
#outpe <- paste0(bedprefix, "flk.ped")
#outma <- paste0(bedprefix, "flk.map")
outfa <- paste0(bedprefix, "flk.fam")

eth <- as.data.frame(fread(ethnicity, header=F, nThread = 15))
fam <- as.data.frame(fread(famname, header = F, nThread = 20))
fam$V5 <- as.integer("1")
eth <- data.frame(V3=eth$V3,V2=eth$V2)
hap <- merge(eth, fam, by = "V2", sort=F)
hap <- hap[,-c(1)]
fwrite(hap, file = outfa, col.names=F, sep = " ", 
	row.names=F, quote=F, nThread = 30, buffMB = 10)
#map <- as.data.frame(fread(ma, nThread = 15))
#fwrite(map, file = outma, col.names=F, row.names=F, 
#	quote=F, sep = " ", nThread = 30, buffMB = 10)

