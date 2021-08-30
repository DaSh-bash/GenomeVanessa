LepAnchor was run on the cluster with the script: 

module load bioinfo-tools
module load R/4.0.0
module load R_packages/4.0.0

cd /proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/08_LepAnchor_dtol/lep-anchor-code

REF_FASTA=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/data/vanessa_assembly_dtol/genome_assemblies_genome_fasta/ncbi-genomes-2021-03-13/GCA_905220365.1_ilVanCard2.1_genomic.fna.gz

./lepanchor_wrapper2.sh -t 4 -f $REF_FASTA -n 31 -m map_all_chr.txt




The new ref assembly: 
/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/08_LepAnchor_dtol/lep-anchor-code_pruned/REF_LA.fa.gz
