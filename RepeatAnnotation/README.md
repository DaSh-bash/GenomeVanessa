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

cat Arth_monarch_concatenated.fasta >> Vcard_arthro_repbase.lib

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
sed -i 's/Transib/DNA\/Transib/g' $1
sed -i 's/unknown/Unknown/g' $1




ARTEFACT
buffer
DNA
DNA/Academ
DNA/Academ-1
DNA/Chapaev
DNA/CMC
DNA/CMC?
DNA/CMC-Chapaev
DNA/CMC-Chapaev-3
DNA/CMC-DNA/DNA/Transib
DNA/CMC-EnSpm
DNA/CMC-EnSpm?
DNA/Crypton
DNA/Crypton-I
DNA/Crypton-V
DNA/Dada
DNA/DNA/Merlin
DNA/DNA/Transib
DNA/Ginger
DNA/Ginger1
DNA/Ginger-1
DNA/Ginger-2
DNA/Ginger2TDD
DNA/Gypsy
DNA/Harbinger
DNAhAT
DNA?/hAT?
DNA/hAT
DNA/hAT?
DNA/hAT-Ac
DNA/hAT-Ac?
DNA/hAT-Blackjack
DNA/hAT-Charlie
DNA/hAT-hAT19
DNA/hAT-hAT19?
DNA/hAT-hAT5
DNA/hAT-hATm
DNA/hAT-hATm?
DNA/hAT-hATw
DNA/hAT-hATx
DNA/hAT-hobo
DNA/hAT-Pegasus
DNA/hAT-Tag1
DNA/hAT-Tip100
DNA/Helitron
DNA/HelitronD
DNA/IS3EU
DNA/Kolobok
DNA/Kolobok-E
DNA/Kolobok-Hydra
DNA/Kolobok-T2
DNA/Kolobok-T2?
DNAMariner
DNA/Mariner
DNA/Mariner_albimanus
DNA/Maverick
DNA/Merlin
DNA/MuDR
DNA/MULE-F
DNA/MuLE-MuDR
DNA/MULE-MuDR
DNA/MULE-MuDR?
DNA/MULE-NOF
DNA/MULE-Ricksha
DNA/Novosib
DNA/P
DNA/Pif-Harbinger
DNA/PIF-Harbinger
DNA/PIF-Harbinger?
DNA/PIF-HarbS
DNA/PIF-ISL2EU
DNA/PIF-ISL2EU?
DNA/PIF-Spy
DNA/piggyBac
DNA/PiggyBac
DNA/PiggyBac?
DNA/Polinton
DNAs/EnSpm/CACTA
DNA/Sola
DNA/Sola1
DNA/Sola-1
DNA/Sola2
DNA/Sola-2
DNA/Sola3
DNA/Sola-3
DNA/Tc3
DNA/TcMar
DNA/TcMar?
DNA/TcMar-Fot1
DNA/TcMar-ISRm11
DNA/TcMar-m44
DNA/TcMar-m44?
DNA/TcMar-Mariner
DNA/TcMar-Pogo
DNA/TcMar-Tc1
DNA/TcMar-Tc1?
DNA/TcMar-Tc2
DNA/TcMar-Tc4
DNA/TcMar-Tc4?
DNA/TcMar-Tigger
DNA/TcMar-Tigger?
DNA/Zator
hAT
Helitron
Helitron?
I/LTR
I/LTR/LTR
Interspersed_Repeat
LINE
LINE/CR1
LINE/CR1?
LINE/CR1-Zenon
LINE/Crack
LINE/CRE
LINE/CRE-II
LINE/Daphne
LINE/Dong-R4
LINE/I
LINE/I?
LINE/I-Jockey
LINE/I-Jockey?
LINE/Ingi
LINE/I-Nimb
LINE/IS3EU
LINE/ISL2EU
LINE/Jockey
LINE/Kiri
LINE/L1
LINE/L1-Tx1
LINE/L2
LINE/L2?
LINE/L2B
LINE/Loa
LINE/LOA
LINE/Penelope
LINE/Proto2
LINE/R1
LINE/R1-LOA
LINE/R2
LINE/R2-Hero
LINE/R2-NeSL
LINE/R4
LINE/Rex-Babar
LINE/RTE
LINE/RTE-BovB
LINE/RTE-ORTE
LINE/RTE-RTE
LINE/RTE-RTE?
LINE/RTEX
LINE/RTE-X
LINE/Tad1
LINE/Vingi
LTR
LTR/BEL
LTR/Caulimovirus
LTR/Copia
LTR/DIRS
LTR/ERV1
LTR/ERVK
LTR/Gypsy
LTR/Gypsy?
LTR/Gypsy-Cigr
LTR/LTR
LTRPao
LTR/Pao
LTR/R2
LTR/Unknown
NonLTR
Non-LTR
NonLTR/CRE
NonLTRLTR/R2
NonLTR/Nimb
NonLTR/Outcast
NonLTR/piggy
NonLTR/Tx1
NonLTR/Vingi
Penelope
Retroposon
Retroposon?
Retroposon/I-derived
RNA
rRNA
Satellite
Satellite?
Simple_repeat
SINE
SINE?
SINE2
SINE3
SINE/5S
SINE/5S-Deu
SINE/B2
SINE/HaSE2
SINE/ID
SINE/MIR
SINE/R1
SINE/tRNA
SINE/tRNA-Core
SINE/tRNA-CR1
SINE/tRNA-Deu
SINE/tRNA-Deu-I
SINE/tRNA-Deu-L2
SINE/tRNA-Deu-RTE
SINE/tRNA-I
SINE/tRNA-RTE
SINE/tRNA-V-CR1
SINE/U
snRNA
tRNA
