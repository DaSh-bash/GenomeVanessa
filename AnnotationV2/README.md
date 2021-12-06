## Vanesse cardui annotation curation

# Curating RepeatMasker output

1. Classes that need clarification https://www.jstage.jst.go.jp/article/ggs/94/6/94_18-00024/_html/-char/en

awk '{print $11}' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out | sort | uniq -c

  28 Dna/Sola
 221 Dna/Sola1
 139 Dna/Sola2
 sed -i 's/Dna/DNA/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

   2 Ginger1
  55 Ginger2/TDD

sed -i 's/Ginger1/DNA\/Ginger1/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out
sed -i 's/Ginger2\/TDD/DNA\/Ginger2TDD/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  47 I/Gypsy
sed -i 's/I\/Gypsy/LTR\/Gypsy/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

 257 I/LTR
sed -i 's/I\/LTR\LTR/LTR/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  21 Merlin
sed -i 's/Merlin/DNA\/Merlin/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

15443 NonLTR/CR1
sed -i 's/NonLTR\/CR1/LINE\/CR1/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

 146 NonLTR/Crack
sed -i 's/NonLTR\/Crack/LINE\/Crack/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

 159 NonLTR/CRE - not treated

30149 NonLTR/Daphne
sed -i 's/NonLTR\/Daphne/LINE\/Daphne/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

1984 NonLTR/I
sed -i 's/NonLTR\/I/LINE\/I/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

   1 NonLTR/Ingi
   2 NonLTR/IS3EU
 379 NonLTR/ISL2EU
sed -i 's/NonLTR\/ISL2EU/DNA\/ISL2EU/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

 960 NonLTR/Jockey
sed -i 's/NonLTR\/Jockey/LINE\/Jockey/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

4133 NonLTR/Kiri
sed -i 's/NonLTR\/Kiri/LINE\/Kiri/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  61 NonLTR/L1
sed -i 's/NonLTR\/L1/LINE\/L1/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

4780 NonLTR/L2
sed -i 's/NonLTR\/L2/LINE\/L2/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  88 NonLTR/L2B
sed -i 's/NonLTR\/L2B/LINE\/L2B/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  70 NonLTR/Loa
sed -i 's/NonLTR\/Loa/LINE\/Loa/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  86 NonLTR/Nimb
  40 NonLTR/Outcast
7912 NonLTR/Penelope
sed -i 's/NonLTR\/Penelope/Penelope/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  19 NonLTR/piggy
 292 NonLTR/piggyBac
sed -i 's/NonLTR\/piggyBac/DNA\/piggyBac/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

 384 NonLTR/Proto2
sed -i 's/NonLTR\/Proto2/LINE\/Proto2/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

4556 NonLTR/R1
sed -i 's/NonLTR\/R1/LINE\/R1/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

  75 NonLTR/R2
 425 NonLTR/R4
4281 NonLTR/RTE
sed -i 's/NonLTR\/RTE/LINE\/RTE/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out
  10 NonLTR/SINE
sed -i 's/NonLTR\/SINE/SINE/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

7413 NonLTR/SINE2
sed -i 's/NonLTR\/SINE2/SINE2/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out
   5 NonLTR/SINE3
  42 NonLTR/Tx1
  16 NonLTR/Vingi
6385 RC?/Helitron
sed -i 's/RC?\/Helitron/Helitron/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out
15685 RC/Helitron
sed -i 's/RC\/Helitron/Helitron/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

1975 REP-1_HMM
sed -i 's/REP\-1\_HMM/Unknown/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out
 163 RNA
 155 rRNA
 129 Satellite
  84 snRNA
  95 Transib
sed -i 's/Transib/DNA\/Transib/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out

sed -i 's/unknown/Unknown/g' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out


New repeat stats:
total: 740406
LINE: 106239  14.34%
SINE: 121446  16.40%
DNA: 55228  7.46%
LTR:  16495 2.23%
Unknown: 217678 29.40%
Other classes and simple repeats: 30.17%


3. Controlling overlaps/ RepeatMasker Check
mkdir 01_FeatureOverlapCheck

Preparing repeat annotation:
awk -v OFS='\t' '{print $5,"RepeatMasker","repeat",$6,$7,".",".",".",$11}' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.out > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.gff
remove first line

Preparing gene annotation, extracting exons:
awk '$2=="maker" && $3=="exon" {print}' makerrun3.all.rename.nofasta.norepeats.gff > makerrun3.all.rename.nofasta.norepeats.exon.gff

Intersecting repeats:
bedtools intersect -a makerrun3.all.rename.nofasta.norepeats.exon.gff -b GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.curated.gff -f 0.1 -wa -wb

wc -l makerrun3.GCA.overlap.gff
3073 makerrun3.GCA.overlap.gff

sed '/Simple_repeat/d' makerrun3.GCA.overlap.gff
sed '/Low_complexity/d' makerrun3.GCA.overlap.gff

wc -l makerrun3.GCA.overlap.gff
1110 makerrun3.GCA.overlap.gff

Conclusion: 1110 genes are erroneously annotated?

4. Running RepeatModeler:

#!/bin/bash -l
#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 07-00:00:00
#SBATCH -J Vcard_RepeatModeler
#SBATCH --mail-type=ALL
#SBATCH --mail-user daria.shipilina@gmail.com
#SBATCH -o Vcar_DTol_repmod2.output
#SBATCH -e Vcar_DTol_repmod2.error


#load modules
module load bioinfo-tools
module load RepeatModeler/2.0.1

#make database for Lsin
BuildDatabase -name Vcard_DToL grep -f makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.names makerrun3.all.rename.nofasta.norepeats.gff  > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.gff

awk '$2=="maker" && $3=="exon" {print}'  > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.gff > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff

Preparing repeat annotation:
../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff

Intersecting repeats:
module load BEDTools/2.29.2
bedtools intersect -a makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff -b ../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -f 0.1 -wa -wb

bedtools intersect -a makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff -b ../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -f 1 -wa -wb | awk -F ':' '{print $1}' |awk '{print $9}' | sort | uniq | wc -l/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna

#Run RepeatModeler/2.0.1
RepeatModeler -database Vcard_DToL -pa 20 -LTRStruct


echo "DONE"

5. Get AED scores
grep ">" ../00_Input/makerrun3.all.maker.rename.proteins.fasta | awk '{print $1,$3}' > makerrun3.all.maker.rename.proteins.fasta.AED.score
sed 's/AED://g' makerrun3.all.maker.rename.proteins.fasta.AED.score > makerrun3.all.maker.rename.proteins.fasta.AED.scores
rm makerrun3.all.maker.rename.proteins.fasta.AED.score

Filter for 50% or less
awk '$2 <= 0.5 {print}' makerrun3.all.maker.rename.proteins.fasta.AED.scores | wc -l
15468

Get gene names
awk '$2 <= 0.5 {print $1}' makerrun3.all.maker.rename.proteins.fasta.AED.scores | sed 's/>//g' > makerrun3.all.maker.rename.proteins.genenames.AED50.out

Select genes from fasta:
module load bioinfo-tools seqtk/1.2-r101
seqtk subseq ../00_Input/makerrun3.all.maker.rename.proteins.fasta makerrun3.all.maker.rename.proteins.genenames.AED50.out > makerrun3.all.maker.rename.proteins.AED50.fasta


Checking eAED manually:
>Vcard_DToL02685-RA
grep -n "Vcard_DToL02685-RA" makerrun3.all.maker.rename.proteins.AED50.fasta
30905:>Vcard_DToL02685-RA protein AED:0.47 eAED:1.00 QI:0|-1|0|1|-1|0|1|0|36
sed -n 30905,30910p makerrun3.all.maker.rename.proteins.AED50.fasta
Submitted to InterProScan
No match

grep ">" makerrun3.all.maker.rename.proteins.AED50.fasta | awk '{print $1,$4}' > makerrun3.all.maker.rename.proteins.fasta.eAED.score
sed 's/eAED://g' makerrun3.all.maker.rename.proteins.fasta.eAED.score > makerrun3.all.maker.rename.proteins.fasta.eAED.scores
rm makerrun3.all.maker.rename.proteins.fasta.eAED.score

awk '$2 <= 0.5 {print}' makerrun3.all.maker.rename.proteins.fasta.eAED.scores | wc -l

awk '$2 <= 0.5 {print $1}' makerrun3.all.maker.rename.proteins.fasta.eAED.scores | sed 's/>//g' > makerrun3.all.maker.rename.proteins.genenames.eAED50.out

seqtk subseq makerrun3.all.maker.rename.proteins.AED50.fasta makerrun3.all.maker.rename.proteins.genenames.AED50.out > makerrun3.all.maker.rename.proteins.AED50.eAED50.fasta

6. Curate manually
Filter short proteins:

awk '/^>/ {if (seqlen) print seqlen;print;seqlen=0;next} {seqlen+=length($0)}END{print seqlen}' makerrun3.all.maker.rename.proteins.AED50.eAED50.fasta > makerrun3.all.maker.rename.proteins.fasta.proteinlen.score



awk '/^>/ {if (seqlen) print seqlen;seqlen=0;next} {seqlen+=length($0)}END{print seqlen}' makerrun3.all.maker.rename.proteins.AED50.eAED50.fasta > makerrun3.all.maker.rename.proteins.fasta.proteinlen.score.len

paste makerrun3.all.maker.rename.proteins.fasta.proteinlen.score.names makerrun3.all.maker.rename.proteins.fasta.proteinlen.score.len > makerrun3.all.maker.rename.proteins.fasta.proteinlen

awk '$2 >= 50 {print $1}' makerrun3.all.maker.rename.proteins.fasta.proteinlen | sed 's/>//g' > makerrun3.all.maker.rename.proteins.genenames.long.out

seqtk subseq makerrun3.all.maker.rename.proteins.AED50.eAED.fasta makerrun3.all.maker.rename.proteins.genenames.long.out > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta

6. InterProScan
/sw/bioinfo/InterProScan/5.52-86.0/rackham/interproscan.sh

#!/bin/bash -l
#SBATCH -A snic2021-5-20
#SBATCH -n 2
#SBATCH -t 60:00:00
#SBATCH -J InterProScan
#SBATCH --mail-type=ALL
#SBATCH --mail-user daria.shipilina@gmail.com
#SBATCH -o interproscan.output
#SBATCH -e interproscan.error


#load modules
module load bioinfo-tools InterProScan/5.52-86.0

#run the scan
/sw/bioinfo/InterProScan/5.52-86.0/rackham/interproscan.sh -i /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_Annotation_Curation/02_AEDScoreFilter/makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta


echo "DONE"

7. Cleaning gff file after AED cleaning based on GFF evidence
Test:
grep "LR999929.1"  makerrun3.all.rename.nofasta.norepeats.gff | awk '/Vcard/ && $3=="mRNA" {print $9}'| grep "repeatmasker" | wc -l

grep -f makerrun3.all.maker.rename.proteins.genenames.long.out makerrun3.all.rename.nofasta.norepeats.gff > makerrun3.all.rename.nofasta.norepeats.AED50.eAED50.long.gff


grep "repeat" makerrun3.all.rename.nofasta.norepeats.AED50.eAED50.long.gff |awk '{print $9}' | awk -F ";" '{print $1}' | sed 's/ID=//g' > makerrun3.all.rename.nofasta.norepeats.AED50.eAED50.long.pred_repeat.names

*WARNING! REMOVE THSE GUYS AFTER INTERPRO!*

grep -v -f makerrun3.all.rename.nofasta.norepeats.AED50.eAED50.long.pred_repeat.names makerrun3.all.maker.rename.proteins.genenames.long.out | wc -l

8. InterProScan Filtering
Creating keywords to check:
DNase
DNase I-like
transcriptase
Endonuclease/exonuclease
RT_nLTR_like
transposable
Baculovirus
Transposase
RETROTRANSPOSON	PROTEIN
PiggyBac
DDE superfamily endonuclease
TRANSPOSASE-RELATED
RETROTRANSPOSON
FYVE/PHD-type
TRANSPOSABLE
Helitron
Retrovirus
Harbinger
TRANSPOSON
RETROVIRUS

grep -f transposon_key.words makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta.tsv | awk '{print $1}' | sort | uniq > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.repeats.names

grep -v -f makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.repeats.names ../02_AEDScoreFilter/makerrun3.all.maker.rename.proteins.genenames.long.out > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.names

module load bioinfo-tools seqtk/1.2-r101
seqtk subseq makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.names

9. Merging two annotations *W( manually
Remove

Vcard_DToL11638-RA
Vcard_DToL11766-RA

 10. Controlling overlaps/ New RepeatMasker Check

grep -f makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.names makerrun3.all.rename.nofasta.norepeats.gff  > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.gff

awk '$2=="maker" && $3=="exon" {print}'  > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.gff > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff

Preparing repeat annotation:
../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff

Intersecting repeats:
module load BEDTools/2.29.2
bedtools intersect -a makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff -b ../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -f 0.1 -wa -wb

bedtools intersect -a makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff -b ../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -f 1 -wa -wb | awk -F ':' '{print $1}' |awk '{print $9}' | sort | uniq | wc -l

Manual check:
ID=Vcard_DToL18860-RA
ID=Vcard_DToL18861-RA
ID=Vcard_DToL18862-RA

/proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB

11. Comparative evaluation of two annotations
module load GenomeTools/1.6.1
gt stat Vanessa_cardui-GCA_905220365.1-2021_05-genes.gff3
parsed genome node DAGs: 15700
sequence regions: 36 (total length: 424798336)
multi-features: 23738
genes: 12821
protein-coding genes: 12821
mRNAs: 25754
protein-coding mRNAs: 25754
exons: 249564
CDSs: 215092
five_prime_UTRs: 38485
lnc_RNAs: 2208
ncRNAs: 9
ncRNA_genes: 2802
rRNAs: 166
regions: 36
snRNAs: 115
snoRNAs: 26
tRNAs: 740
three_prime_UTRs: 31569

12. Manual check of our W genes
Vcard_DToL11786-RA    Herpesvirus
Vcard_DToL11794-RA    REVERSE TRANSCRIPTASE DOMAIN-CONTAINING PROTEIN (PTHR33332:SF23)
Vcard_DToL11650-RA    ENDONUCLEASE (PTHR33327:SF3)	-	Strongylocentrotus purpuratu
?Vcard_DToL11518-RA   PIF1-like helicase, SF1_C_RecD
Vcard_DToL11540-RA    C-terminal region of a signal peptide
Vcard_DToL11703-RA    TMHMM   TMhelix Region of a membrane-bound protein predicted to be embedded in the membrane
Vcard_DToL11558-RA    Zinc finger CCHC-type profile
Vcard_DToL11436-RA    Zinc finger CCHC-type profile
Vcard_DToL11663-RA    TMhelix Region of a membrane-bound protein
Vcard_DToL11580-RA    NUCLEAR APOPTOSIS-INDUCING FACTOR 1 (PTHR23098:SF4) Myb/SANT-like DNA-binding domain
Vcard_DToL11505-RA    retropepsin_like
Vcard_DToL11822-RA    SignalP_GRAM_POSITIVE
Vcard_DToL11613-RA    hAT family C-terminal dimerisation region
Vcard_DToL11806-RA    Putative peptidase (DUF1758)

Counting exons:
awk '$3=="exon" {print $9}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.W.all.gff
awk '$3=="exon" {print $9}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.W.all.gff | awk -F ":" '{print $1}' | sort | uniq -c


Checking all annotation:
awk '$3=="exon" {print $9}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.gff | awk -F ":" '{print $1}' | sort | uniq -c | sort | awk '{print $1}' | uniq -c
62 ID=Vcard_DToL00658-RA
62 ID=Vcard_DToL10221-RA
63 ID=Vcard_DToL17780-RA ???

Ngenes Nexons in genes
1199 1
   453 10
   365 11
   289 12
   218 13
   164 14
   124 15
   110 16
    84 17
    59 18
    56 19
  1609 2
    36 20
    32 21
    22 22
    29 23
    24 24
     9 25
    11 26
    12 27
     8 28
    16 29
  1745 3
     9 30
     6 31
     5 32
     2 33
     2 34
     5 35
     3 36
     2 37
     1 38
  1539 4
     1 40
     3 42
     1 45
     1 46
     2 47
     1 48
     2 49
  1409 5
     1 55
  1161 6
     2 62
     1 63
   899 7
   766 8
   592 9

awk '$3=="exon" {print $9}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.W.all.gff | awk -F ":" '{print $1}' | sort | uniq -c | sort | awk '{print $1}' | uniq -c
    60 1
    36 2
    21 3
     5 4
     4 5
     3 6
     2 8
Checking the way it was prepicted:
 awk -F "-" '{print $4,$5,$6}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.W.gff
 LR999940.1	maker	mRNA	493995	494707	.	+	.	ID=Vcard_DToL11400-RA;Parent=Vcard_DToL11400;Name=Vcard_DToL11400-RA;Alias=maker-LR999940.1-exonerate_est2genome-gene-5.0-mRNA-1;_AED=0.00;_QI=158|1|0.5|1|0|0|2|0|173;_eAED=0.00;score=677;
LR999940.1	maker	mRNA	4008765	4009416	.	-	.	ID=Vcard_DToL11516-RA;Parent=Vcard_DToL11516;Name=Vcard_DToL11516-RA;Alias=maker-LR999940.1-exonerate_est2genome-gene-40.0-mRNA-1;_AED=0.00;_QI=261|1|1|1|0|0|2|0|119;_eAED=0.00;score=618;
LR999940.1	maker	mRNA	4126076	4127694	.	+	.	ID=Vcard_DToL11519-RA;Parent=Vcard_DToL11519;Name=Vcard_DToL11519-RA;Alias=maker-LR999940.1-exonerate_est2genome-gene-41.0-mRNA-1;_AED=0.00;_QI=647|1|1|1|0|0|3|201|103;_eAED=0.00;score=5568;
LR999940.1	maker	mRNA	10576361	10577053	.	+	.	ID=Vcard_DToL11702-RA;Parent=Vcard_DToL11702;Name=Vcard_DToL11702-RA;Alias=maker-LR999940.1-exonerate_est2genome-gene-105.0-mRNA-1;_AED=0.00;_QI=22|1|1|1|0|0.5|2|296|72;_eAED=0.00;score=2616;


grep "Vcard_DToL11519-RA" makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta.tsv - no prediction
grep "Vcard_DToL11702-RA" makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta.tsv - no prediction


awk '$3=="exon" {print $9}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.W.all.gff | awk -F ":" '{print $1}' | sort | uniq -c | sort > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.W.all.exonN.stats


awk '$1 != 1 {print $2}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.W.all.exonN.stats | sed 's/ID=//g' > W.genes.moretone.exon.names

grep -f W.genes.moretone.exon.names makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta.W.tsv


Predicting number of genes:
13090 now
11891 after removing genes with 1 exon
11820 after removing rest of W "genes"

13. Next overlap checked

Intersecting repeats:
module load BEDTools/2.29.2
bedtools intersect -a makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff -b ../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -f 0.1 -wa -wb

bedtools intersect -a makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.exon.gff -b ../../RepeatMasker_Vanessa/02_RepeatMaskingVanessaDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -f 1 -wa -wb | awk -F ':' '{print $1}' |awk '{print $9}' | sort | uniq | wc -l


(base) [daria@rackham2 04_FeatureOverlapCheckNewMasking]$ awk '{print $9,$19}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.similarity | grep -v "rnd" |wc -l
618
(base) [daria@rackham2 04_FeatureOverlapCheckNewMasking]$ awk '{print $9,$19}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.similarity | grep -v "ltr" |wc -l
1979
(base) [daria@rackham2 04_FeatureOverlapCheckNewMasking]$ awk '{print $9,$19}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.similarity | grep "ltr" |wc -l
379
(base) [daria@rackham2 04_FeatureOverlapCheckNewMasking]$ awk '{print $9,$19}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.similarity | grep "n" |wc -l
2358
(base) [daria@rackham2 04_FeatureOverlapCheckNewMasking]$ awk '{print $9,$19}' makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.similarity | grep ")n" |wc -l
71
(base) [daria@rackham2 04_FeatureOverlapCheckNewMasking]$

2358 genes have overlap of 90% with exon
  1740 from RepeatModeller main prediction
  379 from LTR prediction tool
  86 simple repeats or A-rich



13090 - 1199 - 2358

12. Checking total number of functional annotations
See GoogleDoc

13. Moving "TEs" to the TE database
module load bioinfo-tools seqtk/1.2-r101
seqtk subseq makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.fasta makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.repeats.names > makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.repeats.fasta

The idea overlap "genes" and repeats

14. Attempt to rerun maker
/proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/

Makre_opts:
maker_gff=/proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_Annotation_Curation/03_InterProScan/makerrun3.all.maker.rename.proteins.AED50.eAED50.long50.norepeatdomain.gff

rm_gff=/proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/02_RepeatMaskingVanessaArthropodDB/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff
