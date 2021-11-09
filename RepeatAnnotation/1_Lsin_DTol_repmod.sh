#!/bin/bash -l
#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 07-00:00:00
#SBATCH -J Lsin_DTol_RepeatModeler2.0.1
#SBATCH --mail-type=ALL
#SBATCH --mail-user melihoten@gmail.com
#SBATCH -o Lsin_DTol_repmod2.output
#SBATCH -e Lsin_DTol_repmod2.error


#load modules
module load bioinfo-tools
module load RepeatModeler/2.0.1

#make database for Lsin
BuildDatabase -name Lsin_DToL Lsin_DToL.fasta

#Run RepeatModeler/2.0.1
RepeatModeler -database Lsin_DToL -pa 20 -LTRStruct 


echo "DONE"
