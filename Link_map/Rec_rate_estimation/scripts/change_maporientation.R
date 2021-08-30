#change orientation of scaffold vs map


#list_neg <- list(3,10,13,16,18,24,25,26,28,29)
list_neg_files <- paste("ordered.", c(2,5,7,8,9,10,11,15,17,19,23,24,26,28,30),".mapped.txt", sep = "")


for (i in list_neg_files) {
  #print(i)
  pathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/mapped_pruned/",i, sep = "")
  newpathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/mapped_rearr/",i, sep = "")
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

for (i in list_rest_files) {
  #print(i)
  pathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/mapped_pruned/",i, sep = "")
  newpathfile=paste("~/Desktop/link_map_vanessa/output/LepMak3r_dtol/mapped_rearr/",i, sep = "")
  #read file
  chr <- read.table(pathfile)
  # #keep only first 4 columns
  chr <- chr[,1:4]
  # #reverse map
  chr$V2 <- chr$V2 - min(chr$V2)
  print(head(chr))
  # #write file
  write.table(chr, file = newpathfile, col.names = FALSE, row.names = FALSE, quote = FALSE)
}

