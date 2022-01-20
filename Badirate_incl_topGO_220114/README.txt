In this folder the important files for Badirate is kept

badirate_mod.Rmd is the main file for running badirate, OBS needs manual checking and is not automated.
#run time: for one foreground branch (sp) and ~10000 orthogroups on laptop:  6h
#run time gr 4h

input/ Output and modified output from OrthoFinder
ls Badirate/input/
Orthogroups.GeneCount.tsv	Orthogroups.GeneCount_mod.tsv	orthofinder_210624_ultra.nw	orthofinder_210624_ultra_mod.nw

scripts/ additional scripts useful for actually running badirate and parsing output
ls scripts/
badi_script.txt 
badirate_parse_likelihoods.sh
badirate_parse_likelihoods_02.sh
get_best_model_gains.sh
gene_selector_mod.sh

results/ The summary output from all the models run in badirate, intermediate files and files for input to topGO. 
The raw output are >14 000 files for each model and repl so they are not kept here. 

TopGO/
GO_analysis of resulting gene gains from Badirate
scripts/ result_topGO/ TopGO_Data_Prep/
