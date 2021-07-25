#!/bin/bash

awk '{print $2}' $1 | tr -d \" | tail -n +2 > $1.tmp

grep -Fwf $1.tmp Vcardui_Orthogroups.tsv | fmt -1 > $1_Genes_OGs.tmp
sed '/OG/d' $1_Genes_OGs.tmp  |  tr -d , 
rm *tmp
