#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "TO BE FIXED"
   echo "Script calculates number and length of repeats from RepeatMasker .out file"
   echo "Creates file per chromosome"
   echo "Currently supported categories: SINE, LINE, DNA transposons, LTR, NonLTR"
   echo
   echo "Syntax: bash repeats_run_all_chroms.sh [-h] <window_size> <input_repeats> <input_index>"
   echo
   echo "Options:"
   echo "       <window_size>           Length of window (in base pairs)"
   echo "       <input_repeats>         Input file to read. Should be output file from RepeatMasker (.out)"
   echo "       <input_index>           Index file for whole genome (or any numbers of chromosomes) (.fai)"
   echo "       -h                      Print this help"
   #echo "v     Verbose mode."
   #echo "V     Print software version and exit."
   echo
   echo "Created by DSh, 2021"
}

################################################################################
# Main program                                                                 #
################################################################################
# Process the input options                                                    #
################################################################################
# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done


################################################################################
# Main script                                                                  #
################################################################################
INDEX=$3

while IFS=$'\t' read -r -a myArray
do
	for line in "${myArray[0]}" 
	do
		len="${myArray[1]}"
		windows_num_tmp=$(expr $len / $1 )
		windows_num=$(expr $windows_num_tmp + 1)
		nohup bash windowed_gene_density_per_chromosome.sh $1 $len $line $2 > $line-genecount.tsv &
		#wait
	done
done < "$3" 


