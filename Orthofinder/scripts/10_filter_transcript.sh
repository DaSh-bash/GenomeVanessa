#10_filter_transcript.sh
#filter to only one transcript per gene?

awk '/-RA/{print;getline;print}' data/Bicyclus_anynana.fa > filtered_data/Bicyclus_anynana.fa

#no reduction
awk '/-PA/{print;getline;print}' data/Danaus_plexippus.fa > filtered_data/Danaus_plexippus.fa

awk '/-RA/{print;getline;print}' data/Heliconius_erato_lativitta.fa > filtered_data/Heliconius_erato_lativitta.fa

awk '/.g1.t1 h/ {print;getline;print}' data/Heliconius_melpomene_melpomene.fa > filtered_data/Heliconius_melpomene_melpomene.fa
#add-RA
awk '/-RA/ {print;getline;print}' data/Heliconius_melpomene_melpomene.fa >> filtered_data/Heliconius_melpomene_melpomene.fa 

awk '/-RA/ {print;getline;print}' data/Junonia_coenia.fa > filtered_data/Junonia_coenia.fa

