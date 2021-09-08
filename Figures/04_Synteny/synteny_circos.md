# Synteny plot walkthrough
cd /proj/uppstore2017185/b2014034_nobackup/Dasha/GenomeEvaluation_Vanessa/04_Syntheny/VanessaBombyx/circos_van_lept

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
