#this puts all the likelihoods in one table

#this also includes the header and the orthogroups
paste results/gr01.likelihood.txt results/gr02.likelihood.txt | awk 'BEGIN{print "orthogroup gr01 gr02"}{print $1,$3,$6}' | sed -E 's/..\/raw_output\/gr\/|.tsv.gr01.bd\://g' > results/general_results.txt

#the following add the likelihoods from the other models
paste results/sp01.likelihood.txt results/sp02.likelihood.txt | awk 'BEGIN{print "sp01 sp02"}{print $3, $6}' | paste results/general_results.txt - > results/general_results1.txt && mv results/general_results1.txt results/general_results.txt

paste results/spM01.likelihood.txt results/spM02.likelihood.txt | awk 'BEGIN{print "spM01 spM02"}{print $3, $6}' | paste results/general_results.txt - > results/general_results1.txt && mv results/general_results1.txt results/general_results.txt 

paste results/spV01.likelihood.txt results/spV02.likelihood.txt | awk 'BEGIN{print "spV01 spV02"}{print $3, $6}' | paste results/general_results.txt - > results/general_results1.txt && mv results/general_results1.txt results/general_results.txt 

