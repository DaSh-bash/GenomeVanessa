#!/bin/bash -l
#SBATCH -A snic2021-5-20
#SBATCH --job-name=turdus.busco
#SBATCH -n 1
#SBATCH --time=04:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=daria.shipilina@gmail.com

module load bioinfo-tools
module load BUSCO/4.1.4
cd /home/daria/busco
source $AUGUSTUS_CONFIG_COPY
run_BUSCO.py -i /domus/h1/daria/Assembly2.scafSeq.fasta -l eukaryota_odb10 -o busco_turdus -m genome




module load bioinfo-tools
module load quast/5.0.2
python /sw/bioinfo/quast/5.0.2/rackham/bin/quast.py -e -r /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna -g /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker3_run/maker3run1.all.gff

cd /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna
