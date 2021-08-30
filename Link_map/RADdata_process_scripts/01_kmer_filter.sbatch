#! /bin/bash -l
#SBATCH -A snic2020-5-20
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 48:00:00
#SBATCH -J linkmap_vanessa_kmer
#SBATCH -e linkmap_vanessa_kmer_201015.error
#SBATCH --mail-user karin.nasvall@ebc.uu.se
#SBATCH --mail-type=ALL

module load bioinfo-tools 
module load Stacks/2.2

cd /proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/working/

input_path=../data/process_radtags/
output_path=../result/kmer_distr/

for R1 in $(ls $input_path | grep ".1.fq"); do # Loop to iterate over all read 1 files
  R2=$(echo $R1 | sed 's/1.fq/2.fq/') # Assuming that your R1 and R2 have the same name excepting R1 for R2, assign the right name for R2 to a variable called R2
  kmer_filter -1 $input_path/$R1 -2 $input_path/$R2 -i gzfastq -o $output_path --k_dist # run kmer_filter to each pair-end files
done

