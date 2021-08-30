#load map data into R and process to clean individual species
#final version, updated 11/6/2014
#modified 210407 by Karin N??svall
#first change orientation of maps with neg orientation (script change_maporientation.r)
#then concatenate to one map (script concat_maps.sh)

#function to parse notes field in GFF files, needed for some maps
parse_gff_notes <- function(x) {
  x=as.character(x)
  com<-strsplit(x, split=c(";"), fixed=T)
  cm<-sub(pattern="Note\\s+", "", com[[1]][2], perl=T)
  cm<-as.numeric(sub(pattern="\\s+cM.*", "", cm, perl=T))
  mk<-sub(pattern="GMap\\s+", "", com[[1]][1], perl=T)
  return(c(cm, mk))
}

#make map info file
map.info<-data.frame(sp=character(0), num.chr=numeric(0), map.length=numeric(0), markers=numeric(0));

#vcardui
#load map with intervals (number of recombinations) from LepMap3.
#Intervals includes the uncertainty of the position so use the average ((V5 + V6)/2)
#To get cM divide by nr of offspring x 100.
#nr of offspring are 90
#map=read.table("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est.table")
#map$V7 <- round((map$V5 + map$V6)*100/(90*2), digits = 2)

#Use order position instead, the distance is in cm already.
map_order=read.table(("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/input_rec_rate_est2_thin_rearr.table"))
head(map_order)
map_order$V5 <- "vcar"
names(map_order) = c("chr", "marker", "cm", "mb", "sp")


vcar <- map_order
map.info=rbind(map.info, data.frame(sp="vcar", num.chr=length(unique(vcar$chr)), map.length=sum(aggregate(vcar$cm, by=list(chr=vcar$chr), max)$x), markers=length(unique(vcar$marker))))

##write output##
#output is a data frame for each species (total 40) with the genetic and physical map information. All maps are filtered to include only autosomes, and in some cases only a subset of autosomes (where either there is no marker information for small chromosomes, or some chromsomes have inversions or other issues that prevents usability). Also produces a data frame, map.info, with information on each map

#clean up temporary objects
map.info.raw<-map.info

#concatencate all maps into a list
all_maps<-list(vcar=vcar)

#write raw map objects to file
save(list=ls(pattern="^\\w\\w\\w\\w$"), file="raw_genetic_maps_kn_mod.RData")

#write list to file
save(all_maps, file="all_maps_list_KN_rearr_mod.RData")

#write raw map info
write.table(map.info.raw, file="map_info_raw_KN_rearr_mod.txt", sep="\t", col.names=T, row.names=F, quote=F)

