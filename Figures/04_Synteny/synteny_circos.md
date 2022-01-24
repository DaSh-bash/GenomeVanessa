# Synteny plot walkthrough
cd /proj/uppstore2017185/b2014034_nobackup/Dasha/GenomeEvaluation_Vanessa/04_Syntheny/VanessaBombyx/circos_van_lept

Edit your response: https://docs.google.com/forms/d/e/1FAIpQLSe8HV83f1UZ352K0EGGT6xYu4_Acdgfv04LiNibZLWkHF1m9A/viewform?edit2=2_ABaOnueGLiPi3NkpPnUc3-RcS1ZtSd8zVYwctVGyEfQ7o0KoKa1qwSFs0KL3U-xVostYihw

## Making karyotype files
##Lars
module load biopython
python make_circos_karyotype.py Heliconius_melpomene_melpomene_Hmel2.5.scaffolds.fa hmel_kar

sed 's/fa_//g' bomb_kar | sed 's/SK_chr//g' > bombyx.kary

sed 's/nobackup\/Dasha\/Vanessa_//g' vaness_kar | sed 's/LR/VC/g' | sed 's/\.1//g' > vanessa.kary


condition  = 1
thickness  = eval(sprintf("%d",remap_round(max(var(size1),var(size2)),1,25000,2,6)))
radius     = eval(sprintf("%fr",remap(min(var(size1),var(size2)),1,25000,0.5,0.999)))
color      = eval(sprintf("spectral-11-div-%d",remap_round(scalar min(var(size1),var(size2)),1,25000,1,11)))
z          = eval(int(max(var(size1),var(size2))/100))
</rule>



<rules>

  <rule>	# This rule will set the z-depth for each link independently, as a function of its size.
    condition  = 1
    z          = eval(scalar min(var(size1),var(size2)))
  </rule>

  <rule>		
  condition  = 1
  thickness  = eval(sprintf("%d",remap_round(max(var(size1),var(size2)),1,25000,2,6)))
  radius     = eval(sprintf("%fr",remap(min(var(size1),var(size2)),1,25000,0.5,0.999)))
  color      = eval(sprintf("spectral-11-div-%d",remap_round(scalar min(var(size1),var(size2)),1,25000,1,11)))
  z          = eval(int(max(var(size1),var(size2))/100))
  </rule>

</rules>


awk '$4=="VC999937" {print $0" color=79,51,34"}' hmel_vca.links

$ awk '{
if ($4=="VC999937")
	print $0" color=79,51,34";
else
	print $0;
}' hmel_vca.links



sed -i "s/\\t\///g" filename
For MAc
sed 's/        /,/g' chromosome_color.map



http://www.zonums.com/online/color_converter/

## New figure
cd /proj/uppstore2017185/b2014034_nobackup/Dasha/VanessaCircos
cp fils from Karin

grep -v -f ../accepted.gene.name orginal.maker3.genes > rejected.genes

wc -l bmor_vca.gff
**30627** bmor_vca.gff

sed 's/-RA//g' rejected.genes > rejected.round2.maker3.genes

grep -v -f rejected.round2.maker3.genes bmor_vca.gff | wc -l
**28278**

grep -v -f rejected.round2.maker3.genes bmor_vca.blast | wc -l
**136769**
(base) [daria@rackham2 bmor_filtered]$ wc -l bmor_vca.blast
**154209** bmor_vca.blast

./MCScanX bmor-filtered/bmor-vca-filtered

sed 's/-/ /' bmor_vca_filtered.collinearity | awk 'NR>11 {print $3, $4}' | grep -C 1 "score" | grep -v "score\|--" | awk '{print $1"\n"$2}' > blocklist.tmp

awk 'END {print $3"\n"$4}'  bmor_vca_filtered.collinearity >> blocklist.tmp

while read line; do grep "$line" MCScanX-master/hmel_vca_filtered/hmel_vca_filtered.gff; done < blocklist_hmel.tmp | paste -d " " - - - - > hmel_vca_filtered.link

awk '{if ($7<$15) {if ($7<$8 && $15<$16) print $1, $3, $12, $5, $7, $16; else if ($7>$8 && $15<$16) print $1, $3, $12, $5, $8, $16; else if ($7<$8 && $15>$16) print $1, $3, $12, $5, $7, $15; else if ($7>$8 && $15>$16) print $1, $3, $12, $5, $8, $15}
 else if ($7>$15) {if ($7>$8 && $15>$16) print $1, $3, $12, $5, $7, $16; else if ($7<$8 && $15>$16) print $1, $3, $12, $5, $8, $16; else if ($7>$8 && $15<$16) print $1, $3, $12, $5, $7, $15; else if ($7<$8 && $15<$16) print $1, $3, $12, $5, $8, $15}}' bmor_vca_filtered.link > bmor_vca_filtered.links

rm -f blocklist.tmp

 circos -conf circos_bombyx_filtered.conf -outputfile circos_bombyx_filtered1.png

 bash assign_color_to_links_bomb.sh bmor_vca_filtered.links > bmor_vca_filtered_color.links

**HELICONIUS**

grep -v -f rejected.round2.maker3.genes hmel_vca.gff

grep -v -f ../rejected.round2.maker3.genes hmel_vca.gff > hmel_vca_filtered.gff

grep -v -f ../rejected.round2.maker3.genes hmel_vca.blast > hmel_vca_filtered.blast

./MCScanX hmel_vca_filtered/hmel_vca_filtered

sed 's/-/ /' hmel_vca_filtered/hmel_vca_filtered.collinearity | awk 'NR>11 {print $3, $4}' | grep -C 1 "score" | grep -v "score\|--" | awk '{print $1"\n"$2}' > ../../blocklist_hmel.tmp

awk 'END {print $3"\n"$4}'  MCScanX-master/hmel_vca_filtered/hmel_vca_filtered.collinearity >> blocklist_hmel.tmp

while read line; do grep "$line" MCScanX-master/hmel_vca_filtered/hmel_vca_filtered.gff; done < blocklist_hmel.tmp | paste -d " " - - - - > hmel_vca_filtered.link

awk '{if ($7<$15) {if ($7<$8 && $15<$16) print $1, $3, $12, $5, $7, $16; else if ($7>$8 && $15<$16) print $1, $3, $12, $5, $8, $16; else if ($7<$8 && $15>$16) print $1, $3, $12, $5, $7, $15; else if ($7>$8 && $15>$16) print $1, $3, $12, $5, $8, $15}
 else if ($7>$15) {if ($7>$8 && $15>$16) print $1, $3, $12, $5, $7, $16; else if ($7<$8 && $15>$16) print $1, $3, $12, $5, $8, $16; else if ($7>$8 && $15<$16) print $1, $3, $12, $5, $7, $15; else if ($7<$8 && $15<$16) print $1, $3, $12, $5, $8, $15}}' hmel_vca_filtered.link > hmel_vca_filtered.links

bash assign_color_to_links_bomb.sh hmel_vca_filtered.links > hmel_vca_filtered_color.links

circos -conf circos_helicon_filtered.conf -outputfile circos_helicon_filtered1.png

**CIRCOS PLOTS POLISHING**
