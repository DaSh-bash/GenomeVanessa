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
