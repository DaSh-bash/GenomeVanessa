# script to retreive the gain and losses from badirate. The input files are the output from Badirate and from r-script comparing replicates and models

#model
PREFIX=sp

#branch
BRANCH="10->8"

#where the raw output are
OUTPUT_DIR=raw_outputs

#where the summary result files are
RESULT_DIR=results


for file in $(cat $RESULT_DIR/${PREFIX}_best_likelihood.txt);do grep -H -A 16 "Gains" $OUTPUT_DIR/${PREFIX}/$file |tail -n 16 ;done > $RESULT_DIR/${PREFIX}_gains.txt

grep -E $BRANCH $RESULT_DIR/${PREFIX}_gains.txt | cut -f 3- -d "/" | sed "s/.tsv.${PREFIX}01.bd-//g" | sed "s/.tsv.${PREFIX}02.bd-//g" | awk 'BEGIN{print "orthogroup branch gains losses"}{print $0}' > $RESULT_DIR/${PREFIX}_gains_losses.table

#get the losses and gains when sp is best model
sed 's/"//g' $RESULT_DIR/${PREFIX}_vs_gr_OG_list.txt | awk 'FNR==NR && FNR>1 {a[$2]; next} FNR > 1 && ($1 in a) {print $0}' - $RESULT_DIR/${PREFIX}_gains_losses.table > $RESULT_DIR/${PREFIX}_gains_losses_bestmodel.txt

#split in gains and losses
awk '$3>0' $RESULT_DIR/${PREFIX}_gains_losses_bestmodel.txt > $RESULT_DIR/${PREFIX}_gains_bestmodel.txt
awk '$4>0' $RESULT_DIR/${PREFIX}_gains_losses_bestmodel.txt > $RESULT_DIR/${PREFIX}_losses_bestmodel.txt
