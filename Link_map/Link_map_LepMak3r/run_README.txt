
#changes from default
skipping filterstep, using data.call as input for sepchrom

running join_singles.sh to evaluate the best lodLimit for js, output in JS_test 


Change in rules:  
generate_map.smk 
setting separate_chromosomes to only maternal markers informativeMask=2
setting rule join_singles: best map lodLimit 12_10 (after JS_test), distortionLod to 1

order.smk and reorder.smak
setting recombination2=0 for order (female rate 0), minError=0.1 and informativeMask=1 (only male informative)

setting recombination2=0 for reorder (female rate 0), minError=0.1 and informativeMask=1 (only male informative)

