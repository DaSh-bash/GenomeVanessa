#!/bin/bashq

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo
   echo "TO BE UPDATED"
   echo "Script gene number and length of repeats from  file"
   echo "Operater of per chromosome basis"
 #  echo "Currently supported categories: SINE, LINE, DNA transposons, LTR, NonLTR"
   echo
   echo "Syntax: bash .sh [-h] <window_size> <chromosome_length> <chromosome_ID> <input>"
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
echo "chrom begin end CDS_length" # count_SINE length_SINE count_DNA length_DNA count_TcM length_TcM count_LINE length_DNA count_LTR length_LTR count_nonLTR length_nonLTR"

while IFS=$'\t' read -r -a myArray
do
	for line in "${myArray[0]}" 
	do
		begin="${myArray[1]}"
		end="${myArray[2]}"
#		echo "awk '$1 == a && $4>b && $5<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l"
#		echo "$(awk '$1 == a && $4>b && $5<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)"
#		count_gene=$(awk '$1 == a && $4>b && $5<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)		
                length_gene=$(awk '$1 == a && $4>b && $5<c {sum+=$5-$4} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

		echo "$line $begin $end $length_gene"
	done
done < windows_$3.tmp
rm *tmp
