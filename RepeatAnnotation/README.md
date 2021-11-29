Working with repeat annotation

1. Running repeat modeller:

#!/bin/bash -l
#SBATCH -A snic2021-5-20
#SBATCH -p core
#SBATCH -n 20
#SBATCH -t 07-00:00:00
#SBATCH -J Vcard_RepeatModeler
#SBATCH --mail-type=ALL
#SBATCH --mail-user daria.shipilina@gmail.com
#SBATCH -o Vcar_DTol_repmod2.output
#SBATCH -e Vcar_DTol_repmod2.error


#load modules
module load bioinfo-tools
module load RepeatModeler/2.0.1

#make database for Lsin
BuildDatabase -name Vcard_DToL /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna

#Run RepeatModeler/2.0.1
RepeatModeler -database Vcard_DToL -pa 20 -LTRStruct


echo "DONE"

2. Processing results of the repeat modeller

Select genes from fasta:
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n } ' Vcard_DToL-families.fa > Vcard_DToL-families.fa.twolines
grep '#Unknown' Vcard_DToL-families.fa.twolines -A 1 > Vcard_DToL-families.Unknowns.txt
sed -i 's/--//g' Vcard_DToL-families.Unknowns.txt

Also select Unknowns from original library:
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n } ' 13lep_rm1.0_hex.lib > 13lep_rm1.0_hex.twolines
grep '#Unknown' 13lep_rm1.0_hex.twolines -A 1 > 13lep_rm1.0_hex.Unknowns.txt
sed -i 's/--//g' 13lep_rm1.0_hex.Unknowns.txt

Merging them:
cp Vcard_DToL-families.Unknowns.txt Vanessa.Merged.Unknowns.fasta
cat 13lep_rm1.0_hex.Unknowns.txt >> Vanessa.Merged.Unknowns.fasta

Working locally and submittog to online tools censor:
in 3 batches
DIDNT WORK PROCEED WITH ALL OF THEM

cp Vcard_DToL-families.fa.twolines Vcard_repbase.lib
cat 13lep_rm1.0_hex.lib >> Vcard_repbase.lib

3. Polishing Database
Adding latest curated arthropode library + monarchs
wget https://www.dropbox.com/s/xxvangtbgyd7x2k/Arth_monarch_concatenated.fasta?dl=0


Working on labelling:

#!/bin/bash

### Help

Help()
{
   # Display Help
   echo
   echo "Reclassification of RepeatModeler output file"
   echo "Renames classification terms of repeats to reflect higher order classes based on Kojima, 2019"
   echo "eg. "I/Gypsy" will be renamed to "LTR/Gypsy""
   echo "Syntax: bash clean_repeat_classes.sh [-h] <window_size> <input_repeats> <input_index>"
   echo "Options:"
   echo "       -h                      Print this help"
   echo
   echo "Created by DSh, 2021"
}

################################################################################
# Main program                                                                 #
################################################################################
# Process the input options                                                    #
################################################################################
# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done


################################################################################
# Main script                                                                  #
################################################################################
cp $1 $1.old_repeat_classes
sed -i 's/Dna/DNA/g' $1
sed -i 's/Ginger1/DNA\/Ginger1/g' $1
sed -i 's/Ginger2\/TDD/DNA\/Ginger2TDD/g' $1
sed -i 's/I\/Gypsy/LTR\/Gypsy/g' $1
sed -i 's/I\/LTR\LTR/LTR/g' $1
sed -i 's/Merlin/DNA\/Merlin/g' $1
sed -i 's/NonLTR\/CR1/LINE\/CR1/g' $1
sed -i 's/NonLTR\/Crack/LINE\/Crack/g' $1
sed -i 's/NonLTR\/Daphne/LINE\/Daphne/g' $1
sed -i 's/NonLTR\/I/LINE\/I/g' $1
sed -i 's/NonLTR\/ISL2EU/DNA\/ISL2EU/g' $1
sed -i 's/NonLTR\/Jockey/LINE\/Jockey/g' $1
sed -i 's/NonLTR\/Kiri/LINE\/Kiri/g' $1
sed -i 's/NonLTR\/L1/LINE\/L1/g' $1
sed -i 's/NonLTR\/L2/LINE\/L2/g' $1
sed -i 's/NonLTR\/L2B/LINE\/L2B/g' $1
sed -i 's/NonLTR\/Loa/LINE\/Loa/g' $1
sed -i 's/NonLTR\/Penelope/Penelope/g' $1
sed -i 's/NonLTR\/Penelope/Outcast/g' $1
sed -i 's/NonLTR\/piggyBac/DNA\/piggyBac/g' $1
sed -i 's/NonLTR\/Proto2/LINE\/Proto2/g' $1
sed -i 's/NonLTR\/R1/LINE\/R1/g' $1
sed -i 's/NonLTR\/RTE/LINE\/RTE/g' $1
sed -i 's/NonLTR\/R4/LINE\/R4/g' $1
sed -i 's/NonLTR\/R2/LINE\/R2/g' $1
sed -i 's/NonLTR\/SINE/SINE/g' $1
sed -i 's/NonLTR\/SINE2/SINE2/g' $1
sed -i 's/NonLTR\/Vingi/LINE\/Vingi/g' $1
sed -i 's/NonLTR\/Tx1/LINE\/Tx1/g' $1
sed -i 's/NonLTR\/Nimb/LINE\/Nimb/g' $1
sed -i 's/RC?\/Helitron/Helitron/g' $1
sed -i 's/RC\/Helitron/Helitron/g' $1
sed -i 's/REP\-1\_HMM/Unknown/g' $1
sed -i 's/Transib/DNA\/Transib/g' $1
sed -i 's/tRNA/SINE\/tRNA/g' $1
sed -i 's/unknown/Unknown/g' $1

5. Moving artrododes to two liner
awk '!/^>/ { printf "%s", $0; n = "\n" } /^>/ { print n $0; n = "" } END { printf "%s", n } ' Arth_monarch_concatenated.fasta > Arth_monarch_concatenated.fasta.twolines

awk 'BEGIN{FS=" "}{if(!/>/){print toupper($0)}else{print $1}}' Arth_monarch_concatenated.fasta.twolines


cat Arth_monarch_concatenated.fasta >> Vcard_arthro_repbase.lib

Renaming
bash clean_repeat_classes.sh Arth_monarch_concatenated.lib

Checking headers:
grep ">" Arth_monarch_concatenated.lib | awk -F "#" '{print $2}' | sort | uniq -c
     42 SINE/tRNA
      3 tRNA

Checking other headers:
grep ">" Vcard_repbase.lib | awk -F "#" '{print $2}' | sort | uniq -c
3 buffer

cp Vcard_repbase.lib Vcard_arthro_repbase.lib
cat Arth_monarch_concatenated.lib >> Vcard_arthro_repbase.lib


6. New Kimura plots
perl /sw/bioinfo/RepeatMasker/4.1.0/rackham/util/calcDivergenceFromAlign.pl -s GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.tbl.summary GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.cat.gz
perl /sw/bioinfo/RepeatMasker/4.1.0/rackham/util/createRepeatLandscape.pl -div GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.tbl.summary -g 430597972 > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.tbl.summary.kimura.html
