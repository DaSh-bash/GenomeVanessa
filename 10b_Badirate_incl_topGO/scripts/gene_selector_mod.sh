#!/bin/bash

awk '{print $1}' $1 > $1.tmp

for line in $(cat $1.tmp);do grep $line ../topGO/TopGO_Data_Prep/Vcardui_Orthogroups.tsv | fmt -1 >> $1_Genes_OGs.tmp;done

sed '/OG/d' $1_Genes_OGs.tmp  |  tr -d , > $1_genenames.txt_tmp

sort $1_genenames.txt_tmp | uniq > $1_genenames.txt
rm $1.tmp
rm $1_Genes_OGs.tmp
rm $1_genenames.txt_tmp
