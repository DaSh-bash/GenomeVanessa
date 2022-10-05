#!/bin/bash -l

#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J linkage_map_vanessa_MCScanX_blast_vca_vs_hel
#SBATCH -e linkage_map_vanessa_MCScanX_blast__vca_vs_hel.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools blast/2.11.0+


DB_DIR1=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data/db_2.5/Heliconius_melpomene_melpomene.fa
DB_DIR2=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data/db_vcard_210621/
DB_DIR3=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data/db_bmori/

#mkdir $DB_DIR2
#mkdir $DB_DIR3

DIR_DATA1=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data/Heliconius_melpomene_melpomene_Hmel2.5.proteins.fa.gz
DIR_DATA2=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data/Vanessa_cardui.fa
DIR_DATA3=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/data/Bombyx_mori.fa

OUT_DIR=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/input_dir_210621/hmel_vca
#mkdir $OUT_DIR

#cd $DB_DIR2
#makeblastdb -dbtype prot -in $DIR_DATA2 -out Vanessa_cardui.fa -parse_seqids

#cd $DB_DIR3
#makeblastdb -dbtype prot -in $DIR_DATA3 -out Bombyx_mori.fa -parse_seqids
#wait

#cd ../


zcat $DIR_DATA1 | blastp -query - -db $DB_DIR2/Vanessa_cardui.fa -evalue 1e-10 -outfmt 6 -out $OUT_DIR/vca_vs_hel_unfiltered.blast
#blastp -query $DIR_DATA2 -db $DB_DIR3/Bombyx_mori.fa -evalue 1e-10 -outfmt 6 -out $OUT_DIR/bmori_vs_vca_unfiltered.blast &
#blastp -query $DIR_DATA3 -db $DB_DIR3/Bombyx_mori.fa -evalue 1e-10 -outfmt 6 -out $OUT_DIR/bmori_vs_bmori_unfiltered.blast &
#blastp -query $DIR_DATA3 -db $DB_DIR2/Vanessa_cardui.fa -evalue 1e-10 -outfmt 6 -out $OUT_DIR/vca_vs_bmori_unfiltered.blast &
#blastp -query $DIR_DATA2 -db $DB_DIR2/Vanessa_cardui.fa -evalue 1e-10 -outfmt 6 -out $OUT_DIR/vca_vs_vca_unfiltered.blast &
#wait

