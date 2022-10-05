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


23.03.2022

New repeat stats
Based on calculation merging
awk '{sum+=$5;} END{print sum;}' all.100kb.combo_final.tsv
158814099
(base) Chiffchaff:JointAnalysis dshipilina$ awk '{sum+=$6;} END{print sum;}' all.100kb.combo_final.tsv
63427378
(base) Chiffchaff:JointAnalysis dshipilina$ awk '{sum+=$7;} END{print sum;}' all.100kb.combo_final.tsv
30981825
(base) Chiffchaff:JointAnalysis dshipilina$ awk '{sum+=$8;} END{print sum;}' all.100kb.combo_final.tsv
12912780
(base) Chiffchaff:JointAnalysis dshipilina$ awk '{sum+=$9;} END{print sum;}' all.100kb.combo_final.tsv
10474236

total_genome_length   length_rpt  length_LINE	length_SINE	length_DNA	length_LTR
424577752             158814099   63427378    30981825    12912780    10474236
                      37.40%      14.94%      7.30%       3.04%       2.47%     9.65%









/424577752
