#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J linkage_map_vanessa_MCScanX_blastdb
#SBATCH -e linkage_map_vanessa_MCScanX_blastdb.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools blast/2.11.0+


DB_DIR=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data/db_2.5
DIR_DATA=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data

mkdir $DB_DIR
cd $DB_DIR

zcat $DIR_DATA/Heliconius_melpomene_melpomene_Hmel2.5.proteins.fa.gz | makeblastdb -dbtype prot -in - -out Heliconius_melpomene_melpomene.fa -parse_seqids -title "Hel_v2.5"
