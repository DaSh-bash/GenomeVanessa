#script that filters output from blast outfmt6 (sorted by query gene and evalue)

#which analysis
PREFIX=bmor_vca

#where to put the filtered files (input for MCScanX)
OUT_DIR=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/input_dir_210621/$PREFIX

cd $OUT_DIR
for file in $(ls *unfiltered.blast)
do
 
#temp dir to put the split files in, will be deleted
TMP_DIR=/proj/uppstore2017185/b2014034_nobackup/Karin/link_map_vanessa/output/11_MCScanX/tmp

mkdir $TMP_DIR
cd $TMP_DIR

#split the file by gene
awk '{print>$1".tmp"}' $OUT_DIR/$file
wait

#loop over all files and only keep the 5 best hits (sorted by e-value)

for tmpfile in $(ls);do awk 'NR<6 {print $0}' $tmpfile >> $OUT_DIR/${PREFIX}_filtered.blast;done
wait
cd ../
rm -r tmp/

done
