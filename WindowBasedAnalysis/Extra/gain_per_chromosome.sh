#!/bin/bash

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo
   echo "Script calculates number and length of repeats from RepeatMasker .out file"
   echo "Operater of per chromosome basis"
   echo "Currently supported categories: SINE, LINE, DNA transposons, LTR, NonLTR"
   echo
   echo "Syntax: bash repeat_per_chromosome1.0.sh [-h] <window_size> <chromosome_length> <chromosome_ID> <input>"
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
#echo "chrom begin end count_rpt length_rpt count_SINE length_SINE count_DNA length_DNA count_TcM length_TcM count_LINE length_DNA count_LTR length_LTR count_nonLTR length_nonLTR"

while IFS=$'\t' read -r -a myArray
do
	for line in "${myArray[0]}" 
	do
		begin="${myArray[1]}"
		end="${myArray[2]}"
		#echo "$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" repeat_annot_test.out | wc -l)"
		count_gain=$(awk '$1 == a && $2>b && $3<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
		#length_rpt=$(awk '$5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP) 

		#count_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)		
                #length_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

		#count_LINE=$(awk '/LINE/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
                #length_LINE=$(awk '/LINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

		#count_DNA=$(awk '/DNA/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
                #length_DNA=$(awk '/DNA/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

		#count_TcMar=$(awk '/TcMar/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
                #length_TcMar=$(awk '/TcMar/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

		#count_LTR=$(awk '/LTR/ && !/NonLTR/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
                #length_LTR=$(awk '/LTR/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

                #count_nonLTR=$(awk '/NonLTR/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
                #length_nonLTR=$(awk '/NonLTR/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

		echo "$line $begin $end $count_gain"    #$length_rpt $count_SINE $length_SINE $count_DNA $length_DNA $count_TcMar $length_TcMar $count_LINE $length_DNA $count_LTR $length_LTR $count_nonLTR $length_nonLTR"
			
	done
done < windows_$3.tmp
rm *tmp
