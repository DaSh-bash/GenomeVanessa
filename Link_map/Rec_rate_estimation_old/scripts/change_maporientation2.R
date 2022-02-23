#change orientation of scaffold vs map


#list_neg <- list(3,10,13,16,18,24,25,26,28,29)
list_neg_files <- paste("ordered.", c(2,5,7,8,9,10,11,15,17,19,23,24,26,28,30),".mapped.txt", sep = "")


for (i in list_neg_files) {
  #print(i)
  pathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/",i, sep = "")
  newpathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/",i, sep = "")
  #read file
  chr <- read.table(pathfile)
  # #keep only first 4 columns
  chr <- chr[,1:4]
  # #reverse map
  chr$V2 <- max(chr$V2) - chr$V2
  print(head(chr))
  # #write file
  write.table(chr, file = newpathfile, col.names = FALSE, row.names = FALSE, quote = FALSE)
}

#make sure the rest starts with 0 Mb
list_all_files <- paste("ordered.", c(1:31),".mapped.txt", sep = "")
list_rest_files <- list_all_files[!list_all_files %in% list_neg_files]

#or list from folder
list_all_files <- read.table("../../LepMak3r_dtol/list_files.txt")
list_all_files <- as.vector(list_all_files$V1)

#make sure V3 is the map-distance
for (i in list_all_files) {
  #print(i)
  pathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/maps_for_rec_rate/",i, sep = "")
  newpathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/maps_for_rec_rate/",i,"_map", sep = "")
  #read file
  chr <- read.table(pathfile)
  # #keep only first 4 columns
  chr <- chr[,1:4]
  # #reverse map
  chr$V3 <- chr$V3 - min(chr$V3)
  print(head(chr))
  # #write file
  write.table(chr, file = newpathfile, col.names = FALSE, row.names = FALSE, quote = FALSE)
}
