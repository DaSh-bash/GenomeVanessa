### First MAKER3 run was set up in:  
`cd /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker3_run`  
`module load bioinfo-tools maker #loads MAKER3 `  
`maker -CTL`  



[daria@rackham2 functional_annot]$ grep ">" egg_controlled.makerrun3.all.maker.rename.final.proteins.fasta | awk '{print $1,$3}' | awk -F ":" '$2<0.55 {print $2}'| wc -l
12098  
