#script to mapp interval markers to assembly
#OBS! Have to change nr of iterations and nr of linkage groups in the loop and in loop retrieving maps

#specify input and output files and directories
INPUT_PATH=/proj/uppstore2017185/b2014034/nobackup/Karin/link_map_vanessa/output/07_LepMak3r_DTOL
INPUT_DIR=$INPUT_PATH/intervals
OUTPUT_PATH=$INPUT_PATH/mapped_int

INPUT_DATA=$INPUT_PATH/data.call.gz

LG=31

mkdir $OUTPUT_PATH/

#make a file with genome position for all markers
#zcat $INPUT_DATA | cut -f1-2 | awk 'NR>7{print $0}' > $INPUT_PATH/snps.txt

for lg in $(seq 1 1 $LG)
do
awk '(NR==FNR){s[NR-1]=$0}(NR!=FNR){if ($1 in s) $4=s[$1];print}' $INPUT_PATH/snps.txt $INPUT_DIR/ordered.${lg}.intervals > $OUTPUT_PATH/ordered.${lg}.mapped_int.txt
done

#grep "likelihood" $OUTPUT_PATH/  | sort -k4g > $OUTPUT_PATH/likelihoods.txt

#make a list of best likelihoods
#sort -k7 $OUTPUT_PATH/likelihoods.txt | sort -k4 | awk 'NR%5==1' | sort -gk4 > $OUTPUT_PATH/list_best_likelihoods.txt


#set nr according to nr of lg
for i in $(seq 1 1 $LG); do 
#file=$(awk -v i=$i 'NR==i' $OUTPUT_PATH/filenames.txt| cut -f1 -d ":")
awk  -v i=$i '{print $4, $5, $2, $3, $6=i, $7=1}' $OUTPUT_PATH/ordered.${i}.mapped_int.txt | awk '{print $1, $2, $5, $6, $3, $4}' | sed 's/HiC_scaffold_//g' >> $OUTPUT_PATH/order_int_all.txt
done
wait

awk 'BEGIN{print "scaffold position lg index min_dist max_dist"}{print $0}' $OUTPUT_PATH/order_int_all.txt > $OUTPUT_PATH/order_int_all.table

sed 's/\*//g' $OUTPUT_PATH/order_int_all.table > $OUTPUT_PATH/order_int_all2.table
