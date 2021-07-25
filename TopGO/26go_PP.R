library("topGO")
library("Rgraphviz")

setwd("/mnt/griffin/petpru/napiF2QTL_topgo")

geneID2GO <- readMappings(file = "rc3_go_peter.txt")

geneUniverse <- names(geneID2GO)

genesOfInterest.bv <- read.table("cand_genes_26inthe95inexons.txt",header=TRUE)

genesOfInterest.bv <- as.character(genesOfInterest.bv$geneid)
geneList.bv <- factor(as.integer(geneUniverse %in% genesOfInterest.bv))
names(geneList.bv) <- geneUniverse

myGOdata.bv.bp <- new("topGOdata", description="Candidate genes", ontology="BP", allGenes=geneList.bv,  annot = annFUN.gene2GO, gene2GO = geneID2GO, nodeSize= 5)
myGOdata.bv.mf <- new("topGOdata", description="Candidate genes", ontology="MF", allGenes=geneList.bv,  annot = annFUN.gene2GO, gene2GO = geneID2GO, nodeSize= 5)

classic.Fisher.bv.bp <- runTest(myGOdata.bv.bp, algorithm="classic", statistic="fisher")
weight.Fisher.bv.bp <- runTest(myGOdata.bv.bp, algorithm="weight", statistic="fisher")
weight01.Fisher.bv.bp <- runTest(myGOdata.bv.bp, algorithm="weight01", statistic="fisher")
classic.Fisher.bv.mf <- runTest(myGOdata.bv.mf, algorithm="classic", statistic="fisher")
weight.Fisher.bv.mf <- runTest(myGOdata.bv.mf, algorithm="weight", statistic="fisher")
weight01.Fisher.bv.mf <- runTest(myGOdata.bv.mf, algorithm="weight01", statistic="fisher")

pvalFis.mf <- score(weight.Fisher.bv.mf)
pvalFis.bp <- score(weight.Fisher.bv.bp)
pValue.classic.mf <- score(classic.Fisher.bv.mf)
pValue.weight.mf <- score(weight.Fisher.bv.mf)[names(pValue.classic.mf)]
gstat.mf <- termStat(myGOdata.bv.mf , names(pValue.classic.mf))
gSize.mf <- gstat.mf$Annotated / max(gstat.mf$Annotated) * 4

pValue.classic.bp <- score(classic.Fisher.bv.bp)
pValue.weight.bp <- score(weight.Fisher.bv.bp)[names(pValue.classic.bp)]
gstat.bp <- termStat(myGOdata.bv.bp, names(pValue.classic.bp))
gSize.bp <- gstat.bp$Annotated / max(gstat.bp$Annotated) * 4
allRes.bv.bp <- GenTable(myGOdata.bv.bp,
                         classic = classic.Fisher.bv.bp,
                         weight = weight.Fisher.bv.bp,
                         orderBy = "classic", ranksOf = "classic", topNodes = 200)
allRes.bv.mf <- GenTable(myGOdata.bv.mf,
                         classic = classic.Fisher.bv.mf,
                         weight = weight.Fisher.bv.mf,
                         orderBy = "classic", ranksOf = "classic", topNodes = 200)

write.table(allRes.bv.bp[,c(1,6)], file = "cand_genes_26inthe95inexons.txt_revigo_bp.tsv", sep = "\t", qmethod = "double", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(allRes.bv.bp, file = "cand_genes_26inthe95inexons.txt_go_bp.tsv", sep = "\t", qmethod = "double", quote = FALSE, row.names = FALSE)
write.table(allRes.bv.mf[,c(1,6)], file = "cand_genes_26inthe95inexons.txt_revigo_mf.tsv", sep = "\t", qmethod = "double", quote = FALSE, row.names = FALSE, col.names = FALSE)
write.table(allRes.bv.mf, file = "cand_genes_26inthe95inexons.txt_go_mf.tsv", sep = "\t", qmethod = "double", quote = FALSE, row.names = FALSE)

