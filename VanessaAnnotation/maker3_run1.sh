#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 50:00:00
#SBATCH -J maker3_run1
#SBATCH -o maker3_run1.out
#SBATCH -e maker3_run1.error
#SBATCH --mail-user daria.shipilina@gmail.com
#SBATCH --mail-type=ALL

module load bioinfo-tools maker
MAKERDIR="maker3_run1"

maker -base ${MAKERDIR} -fix_nucleotides
gff3_merge  -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
fasta_merge -d ${MAKERDIR}.maker.output/${MAKERDIR}_master_datastore_index.log
