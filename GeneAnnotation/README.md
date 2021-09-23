## Gene sets are located in:

 makerrun3.all.maker.gff > functionally annotated > 14560

grep ">" makerrun3.all.maker.rename.final.proteins.fasta | wc -l
14558

[daria@rackham3 functional_annot]$ grep ">" makerrun3.all.maker.rename.final.proteins.fasta | awk -F ":" '{print $3}' | awk '$1 >= 0.5 {print $1}' | wc -l
1920


grep ">" egg_controlled.makerrun3.all.maker.rename.final.proteins.fasta | wc -l
13318


grep ">" egg_controlled.makerrun3.all.maker.rename.final.proteins.fasta | awk '{print $1,$3}' | awk -F ":" '$2<0.55 {print $2}'| wc -l
12098  

12098 makerrun3.all.nofasta.norepeats.doubleQC.sort.gff

[daria@rackham3 functional_annot]$ awk '$3=="gene" {print}' makerrun3.all.nofasta.norepeats.gff | wc -l
18870

### First MAKER3 run was set up in:  
`cd /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker3_run`  
`module load bioinfo-tools maker #loads MAKER3 `  
`maker -CTL`
