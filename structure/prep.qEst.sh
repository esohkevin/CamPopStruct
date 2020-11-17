#!/usr/bin/env bash

#--Cam
grep "(0)" cam.struct.out5_f | grep -v Mean | awk '{print $4,$6,$7,$8,$9,$10}' | sort -g -k1 > 5.q.est.txt
grep "(0)" cam.struct.out4_f | grep -v Mean | awk '{print $4,$6,$7,$8,$9}' | sort -g -k1 > 4.q.est.txt
grep "(0)" cam.struct.out3_f | grep -v Mean | awk '{print $4,$6,$7,$8}' | sort -g -k1 > 3.q.est.txt
grep "(0)" cam.struct.out2_f | grep -v Mean | awk '{print $4,$6,$7}' | sort -g -k1 > 2.q.est.txt

Rscript -e 'pdf("cam.Q3.pdf", colormodel="cmyk", paper="special", width=6, height=5, points=5); par(mfrow=c(2,1)); par(fig=c(0,1,0.50,1), cex.lab=0.7); f <- read.table("3.q.est.txt", h=F); barplot(t(f[,-c(1)]), col=rainbow(3), beside=F, space=F); mtext("Ancestry", side=2, line=2, cex=0.9); dev.off()'

Rscript -e 'pdf("all.pdf", colormodel="cmyk"); par(mfrow=c(4,1)); par(fig=c(0,1,0.70,1)); f <- read.table("5.q.est.txt", h=F); barplot(t(f[,-c(1)]), col=rainbow(5), beside=F, space=F); par(fig=c(0,1,0.55,0.85), new=T); f <- read.table("4.q.est.txt", h=F); barplot(t(f[,-c(1)]), col=rainbow(4), beside=F, space=F); par(fig=c(0,1,0.40,0.70), new=T); f <- read.table("3.q.est.txt", h=F); barplot(t(f[,-c(1)]), col=rainbow(3), beside=F, space=F); par(fig=c(0,1,0.25,0.55), new =T); f <- read.table("2.q.est.txt", h=F); barplot(t(f[,-c(1)]), col=rainbow(2), beside=F, space=F); dev.off()'

#--World
grep "(0)" world.struct.out5_f | grep -v Mean | awk '{print $4,$6,$7,$8,$9,$10}' | sort -g -k1 > 5.w.est.txt
grep "(0)" world.struct.out6_f | grep -v Mean | awk '{print $4,$6,$7,$8,$9,$10,$11}' | sort -g -k1 > 6.w.est.txt

Rscript -e 'pdf("world.pdf", colormodel="cmyk"); par(mfrow=c(4,1)); par(fig=c(0,1,0.70,1)); f <- read.table("6.w.est.txt", h=F); barplot(t(f[,-c(1)]), col=rainbow(6), beside=F, space=F); par(fig=c(0,1,0.55,0.85), new=T); f <- read.table("5.w.est.txt", h=F); barplot(t(f[,-c(1)]), col=rainbow(5), beside=F, space=F); dev.off()'

