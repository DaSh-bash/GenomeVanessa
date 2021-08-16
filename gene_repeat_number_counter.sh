q#!/bin/bash
filename="chromnames.txt"
#echo $filename
all_lines=$(cat $filename)
for line in $all_lines 
do
    #echo "$line" 
    count_gene=$(grep "$line" /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/makerrun3.all.nofasta.gff | awk '$3=="gene"' |  wc -l)
    length_gene=$(grep "$line" /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/makerrun3.all.nofasta.gff | awk '$3=="gene" {sum+=$5-$4} END {print sum}')
    count_rpt=$(grep "$line" /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/makerrun3.all.nofasta.repeats.uniq.gff | wc -l)
    length_rpt=$(grep "$line" /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/makerrun3.all.nofasta.repeats.uniq.gff | awk  '{SUM+=$6} END {print SUM}' ) 

    echo "$line	$count_gene	$length_gene	$count_rpt	$length_rpt"
done
