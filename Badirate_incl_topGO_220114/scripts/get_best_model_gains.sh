# script to retreive the gain and losses from badirate. The input files are the output from Badirate and from r-script comparing replicates and models
#run: bash get_best_model_gains.sh sp '/10->8/'
#branch has to be in the format of awk search pattern ('/10->8/' or '/10->8|17->1\t/' etc)

#model
PREFIX=$1

#branch
BRANCH=$2

#where the raw output are
OUTPUT_DIR=raw_output

#where the summary result files are
RESULT_DIR=results

#get gains and losses (all branches)
for file in $(cat $RESULT_DIR/${PREFIX}_best_likelihood.txt);do grep -H -A 16 "Gains" $OUTPUT_DIR/${PREFIX}/$file |tail -n 16 ;done > $RESULT_DIR/${PREFIX}_gains_all_branch.txt

#get only from the branch(es) of interest
awk $BRANCH $RESULT_DIR/${PREFIX}_gains_all_branch.txt | cut -f 3- -d "/" | sed "s/.tsv.${PREFIX}01.bd-//g" | sed "s/.tsv.${PREFIX}02.bd-//g" | awk 'BEGIN{print "orthogroup branch gains losses"}{print $0}' > $RESULT_DIR/${PREFIX}_gains_branch.table

#get the losses and gains when sp is best model
sed 's/"//g' $RESULT_DIR/${PREFIX}_vs_gr_OG_list.txt | awk 'FNR==NR && FNR>1 {a[$2]; next} FNR > 1 && ($1 in a) {print $0}' - $RESULT_DIR/${PREFIX}_gains_branch.table > $RESULT_DIR/${PREFIX}_gains_branch_bestmodel_prel.txt

#split in gains and losses
awk '$3>0' $RESULT_DIR/${PREFIX}_gains_branch_bestmodel_prel.txt > $RESULT_DIR/${PREFIX}_gains_bestmodel.txt
#awk '$4>0' $RESULT_DIR/${PREFIX}_gains_branch_bestmodel_prel.txt > $RESULT_DIR/${PREFIX}_losses_bestmodel.txt

#only for multiple branches, get OG where both have gains
awk '$1==i {print line;print $0} {i=$1;line=$0}' $RESULT_DIR/${PREFIX}_gains_bestmodel.txt > $RESULT_DIR/${PREFIX}_gains_bestmodel_both.txt
