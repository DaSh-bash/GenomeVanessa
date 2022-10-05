# README for MCScanX
### Vanessa genome assembly project 2021
#### Karin Näsvall


Input files:
1) output from blast (outfmt 6 format) and 2) modified gff

Things to think of:
* Have to blast all against all incl it self
* keep only one gene/transcript (remove -t2, -t3 etc)
* make sure the protein name is the same in blast and gff-file for example remove -RA, .1 and the trailing o in Hmel and changing Hmel chrome to HM
* change order of fields in gff-file (different orders in manual and README-file, example files) for MCScanX input chr, gene, start, end worked now
* tab separation
* rename .bed to .gff then it worked (manual says .bed)


### Step.01 get data

1. download protein.fa and gff-files for H.mel and others of interest

#2.5 is the latest available, chromosome level assembly, with both protein and gff-files
wget http://download.lepbase.org/v4/sequence/Heliconius_melpomene_melpomene_Hmel2.5.proteins.fa.gz
wget http://download.lepbase.org/v4/gff/Heliconius_melpomene_melpomene_Hmel2.5.gff3.gz

#No gff files for Junonia or Melitaea (very recent assembly and annotation out)

and Bombyx chromosome level
wget https://silkdb.bioinfotoolkits.net/__resource/Bombyx_mori/download/gene.all.gff.tar.gz
wget https://silkdb.bioinfotoolkits.net/__resource/Bombyx_mori/download/protein.fa.tar.gz

cp /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/functional_annot/makerrun3.all.maker.rename.final.proteins.fasta 11_MCScanX/data/Vanessa_cardui.fa


### Step.02 blast

* make db and blast all against all (custom batch script)

###### Example
* create blast db with Heliconius genome \
`zcat $DIR_DATA/Heliconius_melpomene_melpomene_Hmel2.5.proteins.fa.gz | makeblastdb -dbtype prot -in - -out Heliconius_melpomene_melpomene.fa -parse_seqids`


* Filter only 5 best hits with custom script. blast manual https://www.ncbi.nlm.nih.gov/books/NBK279684/
#obs only filtered on Evalue 1e-10, (do not use -max_target_seqs, don't know what is really does). If > 5 hits filter out with custom scripts. The output from blast outfmt 6 is sorted on evalue (outfmt 7 is not).

#example from custom script
#split files per gene
awk '{print>$1".tmp"}' ../../input_dir/hel_vs_vca_unfiltered.blast
#print the first 5 lines
for file in $(ls);do awk 'NR<6 {print $0}' $file >> out_blst;done



### Step.03 modify input files


* Find only first transcript and modify genenames
awk '$1 ~ /t1/ || $1 ~ /RA/' input_dir_210621/hmel_vca/hmel_vca_filtered.blast | awk '$2 ~ /t1/ || $2 ~ /RA/' | sed 's/.t1//g' | sed 's/-RA//g' > input_dir_210621/hmel_vca/hmel_vca.blast


* modify gff
* change order of fields (different orders in manual and README-file, example files) for MCScanX input
* chr, gene, start, end
* tab separation

###### hmel
`zcat data/Heliconius_melpomene_melpomene_Hmel2.5.gff3.gz | grep "gene" |awk 'OFS="\t"{print $1,$9,$4,$5}' |sed 's/ID=//g' > input_dir_210621/hmel_vca/hmel_2.5.gff`

###### vcard, no chr info on annotated genes
first retrieve chr, start, end, geneID
`awk '$3=="gene" {print $1,$4,$5,$9}' /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/makerrun3.all.nofasta.norepeats.gff > data/makerrun3.all.nofasta.norepeats_list.gff`

###### list of annotated genes
`awk 'NR>2{print $1}' /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/functional_annot/makerrun3.all.maker.gff | sed 's/-RA//g' > data/vcard_list_annotated_genenames.txt`

###### intersect the two files
`for line in $(cat data/vcard_list_annotated_genenames.txt);do grep $line data/makerrun3.all.nofasta.norepeats_list.gff | cut -f1 -d ";" | sed 's/ID=//g' >> data/vcard_annotated_genes_chr_position.txt;done`

###### change chr names, and order the columns
`sed 's/LR/VC/g' data/vcard_annotated_genes_chr_position.txt | sed 's/\.1//g' | awk 'OFS="\t" {$1=$1; print $1,$4,$2,$3}' > input_dir_210621/hmel_vca/vca.gff`

`sed 's/Hmel/HM/g' input_dir_210621/hmel_vca/hmel_2.5.gff | tr -d "o" > input_dir_210621/hmel_vca/hmel.gff`

###### merge the files
`cat input_dir_210621/hmel_vca/hmel.gff input_dir_210621/hmel_vca/vca.gff > input_dir_210621/hmel_vca/hmel_vca.gff`

##### bmor
`sed 's/\.1//2' input_dir_210621/bmor_vca/bmor_vca_filtered.blast | sed 's/\.1//1' | sed 's/-RA//g' > input_dir_210621/bmor_vca/bmor_vca.blast`

`zcat gene.all.gff.tar.gz | awk '$3=="gene" {print $1,$4,$5,$9}' | cut -f1 -d ";" | awk 'OFS="\t"{print $1,$4,$2,$3}' | sed 's/ID=//g' | sed 's/SK_chr//g' > input_dir_210621/bmor_vca/bmor.gff`


### Step.04 run MCScanX

* cp to MCScanX master folder on laptop
./MCScanX hmel_vca

#### Output:
`Reading BLAST file and pre-processing
Generating BLAST list
91574 matches imported (49926 discarded)
2838 pairwise comparisons
195 alignments generated
Pairwise collinear blocks written to hmel_vca.collinearity [21.712 seconds elapsed]
Tandem pairs written to hmel_vca.tandem
Writing multiple syntenic blocks to HTML files`

#### Output files:
hmel_vca.collinearity
hmel_vca.tandem
hmel_vca.html/*.html


./MCScanX bmor_vca
Reading BLAST file and pre-processing
Generating BLAST list
76864 matches imported (46780 discarded)
1830 pairwise comparisons
226 alignments generated
Pairwise collinear blocks written to bmor_vca.collinearity [15.124 seconds elapsed]
Tandem pairs written to bmor_vca.tandem
Writing multiple syntenic blocks to HTML files

#output files:
bmor_vca.collinearity
bmor_vca.tandem
bmor_vca.html/*.html


### Step.05 visualisation

* prefer to use output and visualise with circos plot

* here are examples of plotting software accompanying MCscanX


Create a control file with nr of pixels and chromosome names

`java -cp downstream_analyses/bin/ circle_plotter -g hmel_vca.gff -s hmel_vca.collinearity -c downstream_analyses/hmel_vca_circle.ctl -o output_PNG_hmel_vca_circle`

#### Visual inspection circle-plot
Two chromosomes with splits from vca to hmel, the rest are fused or syntenic?

Use only the 21 largest scaffolds for plotting
`cut -f1 hmel_vca.gff | uniq -c | grep "HM" | sort -gr | awk '$1>50 {print $2}' | sort | tr "\n" ","`

`java -cp downstream_analyses/bin/ circle_plotter -g hmel_vca.gff -s hmel_vca.collinearity -c downstream_analyses/hmel_vca_circle2.ctl -o output_PNG_hmel_vca_circle2`



* create control file for plotting
`cut -f1 bmor_vca.gff | uniq | tr "\n" "," > downstream_analyses/circle_bmor.ctl`

* use nano to finish
`java -cp downstream_analyses/bin/ circle_plotter -g bmor_vca.gff -s bmor_vca.collinearity -c downstream_analyses/circle_bmor.ctl -o output_PNG_bmor_vca_circle`


Barplot shows rearrangements between chromosmes:

`java downstream_analyses/bar_plotter.java -g ~/Desktop/Proj_vanessa_assembly/output/11d_MCScanX/input/hmel_vcard.gff -s ~/Desktop/Proj_vanessa_assembly/output/11d_MCScanX/input/hmel_vcard.collinearity -c downstream_analyses/bar3.ctl -o output_PNG_test_bar3`

* dotplot (java -cp downstream_analyses/bin/ dot_plotter or java downstream_analyses/dot_plotter.java works both)
`java -cp downstream_analyses/bin/ dot_plotter -g ~/Desktop/Proj_vanessa_assembly/output/11d_MCScanX/input/hmel_vcard.gff -s ~/Desktop/Proj_vanessa_assembly/output/11d_MCScanX/input/hmel_vcard.collinearity -c downstream_analyses/bar2.ctl -o output_PNG_test_dot`

* circle-plot
`java -cp downstream_analyses/bin/ circle_plotter -g hmel_vcard.gff -s hmel_vcard.collinearity -c downstream_analyses/circle2.ctl -o output_PNG_hmel_vca_circle`
