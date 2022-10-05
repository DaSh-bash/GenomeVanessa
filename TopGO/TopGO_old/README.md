# Folder contents
1. BadiRate outputs: \
ex. spM_vs_gr_OG_list.txt

2. OrthoFinder (Orthogroups.tsv) output with only Vanessa-specific genes: \
Vcardui_Orthogroups.tsv
!!!Has to stay here

3. GO term database for all the Vanessa genes.\
 (See below "Creating reference")

4. Lists of genes corresponding to BadiRate output files \
ex. Vanessa_TopGo_reference_base_spT_vs_gr_OG.tsv

5. Script for selecting genes from any BadiRate output (please keep the same file formatting)

Usage example:
#cd to the folder where Vcardui_Orthogroups.tsv file is located
bash gene_selector.sh spM_vs_gr_OG_list.txt

#output will be shown in stdout




### How it was done:

#### Creating reference:

a) Use simple awk to output gene names into separate file:
`awk '{print $1}' makerrun3.all.maker.gff > gene_names.tmp`

b) Parse file with tab as a delimeter (default awk will parse gene descriptions into separate columns)

c) Piping the output to select columns matching pattern "em_GOs=" and saving to temporary file

`awk --field-separator="\t" '{print $9}' makerrun3.all.maker.gff | awk '{sub(/.*em_GOs=/,X,$0);sub(/ .*/,X,$0);print}' > tmp.out`

d) For genes not containing GO terms exchange selected lines to "None"

`sed -i '/ID/c\None' tmp.out`

e) Paste together two resulting tables
`paste gene_names.tmp tmp.out > Vcardui_Orthogroups.tsv`
