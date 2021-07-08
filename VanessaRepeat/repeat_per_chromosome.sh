#!/bin/bash

#create windows
seq 1 $1 $2 > begin.tmp
seq $1 $1 $2 > end.tmp
yes "$3" | head -n $4 > chrom.tmp
paste chrom.tmp begin.tmp end.tmp > windows.tmp

echo "chrom     begin  end    count_rpt length_rpt count_SINE length_SINE count_DNA	length_DNA     count_TcM      length_TcM     count_LINE     length_DNA     count_LTR      length_LTR     count_nonLTR   length_nonLTR"

#REP=repeat_annot_test.out
while IFS=$'\t' read -r -a myArray
do
	for line in "${myArray[0]}" 
	do
		begin="${myArray[1]}"
		end="${myArray[2]}"
		#echo "$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" repeat_annot_test.out | wc -l)"
		count_rpt=$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | wc -l)
		length_rpt=$(awk '$5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out) 

		count_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | wc -l)		
                length_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out)

		count_LINE=$(awk '/LINE/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | wc -l)
                length_LINE=$(awk '/LINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out)

		count_DNA=$(awk '/DNA/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | wc -l)
                length_DNA=$(awk '/DNA/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out)

		count_TcMar=$(awk '/TcMar/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | wc -l)
                length_TcMar=$(awk '/TcMar/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out)

		count_LTR=$(awk '/LTR/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | wc -l)
                length_LTR=$(awk '/LTR/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out)

                count_nonLTR=$(awk '/NonLTR/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | wc -l)
                length_nonLTR=$(awk '/NonLTR/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out)

		echo "$line	$begin	$end	$count_rpt $length_rpt $count_SINE $length_SINE $count_DNA	$length_DNA	$count_TcMar	$length_TcMar	$count_LINE	$length_DNA	$count_LTR	$length_LTR	$count_nonLTR	$length_nonLTR"
		#echo "$(awk '$5 == a {print}' a="$line" repeat_annot_test.out | wc -l)"
		#count_gene=$(grep "$line"  | awk '$3=="gene"' |  wc -l) 
		#echo "end ${myArray[2]}"
		#echo "$(awk '{print $2}' $line)" 
		#awk '{print a,b,$0}' a="$var1" b="$var2" file	
	done
done < windows.tmp
rm *tmp
