## Candidate gene search

We use catalog of monarch candidate genes to see if any of the members of the same genes families experienced similar patterns in Vanessa.

1. Make a list of Monarch gene names \
`grep ">" candidate.combined.fasta > ../monarch.candidates `\
`awk '{print $1}' monarch.candidates | tr -d \> > monarch.candidates.gene.names.txt`

2. Make list of gains \
`awk '$2 > 0 {print $1}' sp_gains_VC_sp_bestmodel.txt > sp_gains_VC_sp_bestmodel_gains.txt`

2. Make list of losses \
`awk '$3 > 0 {print $1}' sp_gains_VC_sp_bestmodel.txt > sp_gains_VC_sp_bestmodel_losses.txt`

3. Output monarch orthogroups we are interested in, gains: \
`grep -Fwf sp_gains_VC_sp_bestmodel_gains.txt Orthogroups.tsv | awk --field-separator="\t" '{print $1,$3}' > orthologs_of_vanessa_gain_monarch.txt`

4. ... and losses \
`grep -Fwf sp_gains_VC_sp_bestmodel_losses.txt Orthogroups.tsv | awk --field-separator="\t" '{print $1,$3}' > orthologs_of_vanessa_loss_monarch.txt`

5. NO losses, NO gains
grep -Fwf monarch.candidates.gene.names.txt orthologs_of_vanessa_loss_monarch.txt
grep -Fwf monarch.candidates.gene.names.txt orthologs_of_vanessa_gain_monarch.txt
