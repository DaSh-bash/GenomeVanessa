#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo
   echo "Script calculates number and length of repeats from RepeatMasker .out file"
   echo "Operates on per chromosome basis"
   echo "Currently supported categories: SINE, LINE, DNA transposons, LTR, NonLTR"
   echo
   echo "Syntax: bash repeat_per_chromosome.sh [-h] <window_size> <chromosome_length> <chromosome_ID> <input>"
   echo
   echo "Options:"
   echo "       <window_size>	        Length of window (in base pairs)"
   echo "       <chromosome_length>	Chromosome length (can be obtained from .fai index file)"
   echo "	<chromosome_ID>         Chromosome ID, identical to one in .out file"
   echo	"	<input>	                Input file to read. Should be output file from RepeatMasker (.out)"
   echo "	-h	                Print this help"
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
# Process the input arguments                                                  #
################################################################################
# Calculating number of windows
windows_num_tmp=$(expr $2 / $1 )
windows_num=$(expr $windows_num_tmp + 1)

REP=$4

################################################################################
# Main script                                                                  #
################################################################################

# Create windows
seq 1 $1 $2 > begin_$3.tmp
seq $1 $1 $2 > end_$3.tmp
echo $2 >> end_$3.tmp
yes "$3" | head -n $windows_num > chrom_$3.tmp
paste chrom_$3.tmp begin_$3.tmp end_$3.tmp > windows_$3.tmp


# Fill in the table
#echo "chrom begin end length_rpt length_SINE length_DNA length_LINE length_LTR length_nonLTR length_simrep"

while IFS=$'\t' read -r -a myArray
do
	for line in "${myArray[0]}" 
	do
		begin="${myArray[1]}"
		end="${myArray[2]}"
#		echo "$line"
#		echo  "$begin $end"
		#echo "$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" repeat_annot_test.out | wc -l)"
		newline=$3
		#echo "$newline"
		length_rpt0=$(awk '$1 == a && $2>b && $3<c {sum+=$3-$2} END {print sum}' a="$line" b="$begin" c="$end" $REP) 
                #length_rpt=$(awk '$2>b && $3<c {sum+=$3-$2} END {print sum}' b="$begin" c="$end" $REP)
		#length_rpt2=$(awk '{sum+=$3-$2} END {print sum}'  $REP)
#		echo "$length_rpt0"
		#echo "$length_rpt"
		#echo "$length_rpt2"
#	        length_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)
#		echo "$length_SINE"
#                length_LINE=$(awk '/LINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)
#		echo "$length_LINE"
#                length_DNA=$(awk '/DNA/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)
#                echo "$length_DNA"
#                length_LTR=$(awk '/LTR/ && !/NonLTR/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)
#                echo "$length_LTR"
#                length_nonLTR=$(awk '/NonLTR/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)
#                echo "$length_nonLTR"
#		length_simrep=$(awk '/Simple_repeat/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)
#                echo "$length_simrep"
		echo "$line $begin $end $length_rpt0" #$length_SINE $length_DNA $length_LINE $length_LTR $length_nonLTR $length_simrep"

	done
done < windows_$3.tmp
#rm *tmp

