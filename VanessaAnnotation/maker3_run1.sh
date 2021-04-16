#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 50:00:00
#SBATCH -J Maker1
#SBATCH -o Maker1.out
#SBATCH -e Maker1.error
#SBATCH --mail-user daria.shipilina@gmail.com
#SBATCH --mail-type=ALL

module load bioinfo-tools maker
MAKERDIR="/proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker3_run"

maker -base ${MAKERDIR} -fix_nucleotides -dsindex
gff3_merge  -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
fasta_merge -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
