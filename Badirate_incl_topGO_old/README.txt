##In this folder the important files for Badirate is kept

badirate_mod.Rmd is the main file for running badirate, OBS needs manual checking and is not automated.

input/ Output and modified output from OrthoFinder
ls Badirate/input/
Orthogroups.GeneCount.tsv	Orthogroups.GeneCount_mod.tsv	orthofinder_210624_ultra.nw	orthofinder_210624_ultra_mod.nw

scripts/ additional scripts useful for actually running badirate and parsing output
ls Badirate/scripts/
badi_script.txt 
get_best_model_gains.sh
gene_selector_mod.sh

result/ The summary output from all the models run in badirate, intermediate files and files for input to topGO. 
The raw output are >14 000 files for each model and replicate so they are not kept here. 

TopGO/
GO_analysis of resulting gene gains from Badirate
scripts/ result_topGO/ TopGO_Data_Prep/
