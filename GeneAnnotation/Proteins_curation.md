**Curation of protein database**

First run of makers included evidence from the file uniprot-lepidoptera-filtered-reviewed.fasta.
Potentially it was not sufficient to find reasonable number of genes. Here I decribe steps for manual curation of unreviewed Swiss prot database: uniprot-lepidoptera-filtered-unreviewed.fasta
The goal to select about several k genes from closely related species.

Command "comm" was used to make sure two datasets don't overlap:\
`comm -12 <( sort uniprot-lepidoptera-filtered-unreviewed.fasta ) <(sort uniprot-lepidoptera-filtered-reviewed.fasta )`

Number of closely related species was checked:\
`grep "Heliconius" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "(Fragment)" | wc -l ` \
7507\
`grep "Heliconius" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
8405\
`grep "Bombyx" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
36031\
`grep "Bombyx" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "(Fragment)" | wc -l`\
966\
`grep "Danaus" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
15565\
`grep "Danaus" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "Fragm" | wc -l`\
2115\
`grep "Erebia" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
1682\
`grep "Erebia" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "Fragm" | wc -l`\
1682\
`grep "Lepidoptera" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
14994\
`grep "Lepidoptera" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "Fragm" | wc -l`\
14983\
`grep "Neptis" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "Fragm" | wc -l`\
317\
`grep "Neptis" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
365\
`grep "Limenitis" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
945\
`grep "Limenitis" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "Fragm" | wc -l`\
677\
`grep "Melitaea" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "Fragm" | wc -l`\
757\
`grep "Melitaea" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
804\
`grep "Aglais" uniprot-lepidoptera-filtered-unreviewed.fasta | grep "Fragm" | wc -l`\
125\
`grep "Aglais" uniprot-lepidoptera-filtered-unreviewed.fasta | wc -l`\
140


We will now create a list of protein names containing species names, excluding fragmented proteins (some mt genes removed):

`grep "Heliconius" uniprot-lepidoptera-filtered-unreviewed.fasta | grep -v "Fragm" | grep -v "Cytochrome"  > curated_gene_names.list
grep "Bombyx" uniprot-lepidoptera-filtered-unreviewed.fasta | grep -v "Fragm" | grep -v "Cytochrome"  >> curated_gene_names.list
grep "Danaus" uniprot-lepidoptera-filtered-unreviewed.fasta | grep -v "Fragm" | grep -v "Cytochrome"  >> curated_gene_names.list
grep "Lepidoptera" uniprot-lepidoptera-filtered-unreviewed.fasta | grep -v "Fragm" | grep -v "Cytochrome"  >> curated_gene_names.list
grep "Melitaea" uniprot-lepidoptera-filtered-unreviewed.fasta | grep -v "Fragm" | grep -v "Cytochrome"  >> curated_gene_names.list`

Vanessa evidence is skipped - nothing nuclear


After this selection we have:\
`wc -l curated_gene_names.list`\
48993 proteins\
`grep "Uncharacterized" curated_gene_names.list | wc -l`\
12086 are uncharacterized

Remove uncharacterized protein names:\
`grep -v "Unchara" curated_gene_names.list > curated_gene_names_charact.list`

We now need to select corresponding proteins, we will do it with seqtk utility: \
`module load bioinfo-tools seqtk`

Seqtk can select fasta lines reading headers from text format, for that we need to remove the first symbol from names:\
`cut -c 2- curated_gene_names_charact.list > curated_gene_names_charact_cl.list

seqtk subseq uniprot-lepidoptera-filtered-unreviewed.fasta curated_gene_names_charact_cl.list > uniprot-lepidoptera-filtered-ueviewed_curated.fasta`

*may need samtools faidx

Something buggy:\
[subseq] tr|G0ZEI6|G0ZEI6_HELME: 59 >= 25\
[subseq] tr|Q1HQ07|Q1HQ07_BOMMO: 1110058 >= 311\
[subseq] tr|A0A212EMF8|A0A212EMF8_DANPL: 49 >= 37\
[subseq] tr|A0A212FFG9|A0A212FFG9_DANPL: 59 >= 59\
[subseq] tr|A0A6J2JYG9|A0A6J2JYG9_BOMMA: 59 >= 51\
[subseq] tr|Q5UAP5|Q5UAP5_BOMMO: 59 >= 25
