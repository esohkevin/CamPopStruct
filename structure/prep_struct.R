#!/usr/bin/env bash

require(data.table)
f <- fread("cam.gen.col12.txt",h=F, data.table=F)
s <- fread("../pca/camWorld3577.eth", h=F, data.table=F)
fs <- merge(f,s,by="V1")
write.table(fs[,c(1,5)], file="cam.struct", col.names=F,row.names=F,quote=F,sep=" ")

f <- fread("world.gen.col12.txt",h=F, data.table=F)
s <- fread("../pca/camWorld3577.eth", h=F, data.table=F)
fs <- merge(f,s,by="V1")
write.table(fs[,c(1,5)], file="world.struct", col.names=F,row.names=F,quote=F,sep=" ")

