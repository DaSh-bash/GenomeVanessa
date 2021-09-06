# Synteny plot walkthrough
cd /proj/uppstore2017185/b2014034_nobackup/Dasha/GenomeEvaluation_Vanessa/04_Syntheny/VanessaBombyx/circos_van_lept

## Making karyotype files
##Lars 
module load biopython
python make_circos_karyotype.py Heliconius_melpomene_melpomene_Hmel2.5.scaffolds.fa hmel_kar

sed 's/fa_//g' bomb_kar | sed 's/SK_chr//g' > bombyx.kary

sed 's/nobackup\/Dasha\/Vanessa_//g' vaness_kar | sed 's/LR/VC/g' | sed 's/\.1//g' > vanessa.kary
