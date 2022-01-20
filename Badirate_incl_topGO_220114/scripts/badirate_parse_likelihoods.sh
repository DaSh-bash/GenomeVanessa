#this script parse the output from badirate
#creating a table with orthogroups in one column and the likelihoods from the different models in the other columns
#use: bash scripts/badirate_parse_likelihoods.sh spV

OUTPUT_DIR=raw_output
RESULT_DIR=results
MODEL=$1
ITER=01

grep "Likelihood:" $OUTPUT_DIR/$MODEL/*.$MODEL$ITER.bd > $RESULT_DIR/$MODEL$ITER.likelihood.txt

ITER=02

grep "Likelihood:" $OUTPUT_DIR/$MODEL/*.$MODEL$ITER.bd > $RESULT_DIR/$MODEL$ITER.likelihood.txt

