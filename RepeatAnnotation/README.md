Working with repeat annotation

1. Running repeat modeller:

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
BuildDatabase -name Vcard_DToL /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna

#Run RepeatModeler/2.0.1
RepeatModeler -database Vcard_DToL -pa 20 -LTRStruct


echo "DONE"

2. Processing results of the repeat modeller

Select genes from fasta:
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n } ' Vcard_DToL-families.fa > Vcard_DToL-families.fa.twolines
grep '#Unknown' Vcard_DToL-families.fa.twolines -A 1 > Vcard_DToL-families.Unknowns.txt
sed -i 's/--//g' Vcard_DToL-families.Unknowns.txt

Also select Unknowns from original library:
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n } ' 13lep_rm1.0_hex.lib > 13lep_rm1.0_hex.twolines
grep '#Unknown' 13lep_rm1.0_hex.twolines -A 1 > 13lep_rm1.0_hex.Unknowns.txt
sed -i 's/--//g' 13lep_rm1.0_hex.Unknowns.txt

Merging them:
cp Vcard_DToL-families.Unknowns.txt Vanessa.Merged.Unknowns.fasta
cat 13lep_rm1.0_hex.Unknowns.txt >> Vanessa.Merged.Unknowns.fasta

Working locally and submittog to online tools censor:
in 3 batches
DIDNT WORK PROCEED WITH ALL OF THEM

cp Vcard_DToL-families.fa.twolines Vcard_repbase.lib
cat 13lep_rm1.0_hex.lib >> Vcard_repbase.lib
