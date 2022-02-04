/proj/uppstore2017185/b2014034_nobackup/Dasha/Scripts_GitHub/GenomeVanessa/WindowBasedAnalysis


## Usage of window scripts

 bash windowed_gene_density_per_chromosom.sh 100000 170000 LR999924.1 repeat_annot_test.out


Some development:
 count_gene=$(grep "$line" /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/makerrun3.all.nofasta.gff | awk '$3=="gene"' |  wc -l)
   length_gene=$(grep "$line" /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/makerrun3.all.nofasta.gff | awk '$3=="gene" {sum+=$5-$4} END {print sum}')



/proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai


/proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/functional_annot/makerrun3.all.nofasta.norepeats.doubleQC.sort.gff


bash windowed_gene_density_run_all_chroms.sh 100000 /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/functional_annot/makerrun3.all.nofasta.norepeats.doubleQC.sort.gff /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai

bash windowed_gene_density_run_all_chroms.sh 100000 /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/functional_annot/makerrun3.all.nofasta.norepeats.doubleQC.sort.gff /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai


cat *genecount.tsv | sed '/chrom/d' > gene_density_100kb_doublQC.tsv


bash windowed_gene_density_per_chromosom.sh 100000 170000 LR999924.1 Gained_Gene_Locations_Orthogroups.gff


bash windowed_gene_exp_density_run_all_chroms.sh 100000 ../Gained_Gene_Locations_Orthogroups.gff /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai



# Create windows
#seq 1 $1 $2 > begin_$3.tmp
#seq $1 $1 $2 > end_$3.tmp
#echo $2 >> end_$3.tmp
#yes "$3" | head -n $windows_num > chrom_$3.tmp
#paste chrom_$3.tmp begin_$3.tmp end_$3.tmp > windows_$3.tmp


# Fill in the table
#echo "chrom begin end count_rpt length_rpt count_SINE length_SINE count_DNA length_DNA count_TcM length_TcM count_LINE length_DNA count_LTR length_$


while IFS=$'\t' read -r -a myArray
do
  	for line in "${myArray[0]}"
        do
          	begin="${myArray[1]}"
                end="${myArray[2]}"
                chrom="$1"
                echo "$line"
                echo "$1"
                echo "$(awk '$1 == a && $5 == "b" {print}'  a="$line" b=$1 $REP )"
                #count_rpt=$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
                #length_rpt=$(awk '$5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

                #echo "$line $begin $end $count_rpt $length_rpt $count_SINE $length_SINE $count_DNA $length_DNA $count_TcMar $length_TcMar $count_LI$

        done
done < orthogroup.ref.list
#rm *tmp



awk 'ORS=NR%83?"\t":RS' orthotest.tsv

bash orthogroups_run_all_chroms.sh Gained_Gene_Locations_Orthogroups.gff /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai

bash orthogroup_counter.sh LR999924.1 Gained_Gene_Locations_Orthogroups.gff


bash ../repeats_run_all_chroms.sh 2000000  /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai

bash ../repeats_run_all_chroms.sh 2000000 /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai

bash ../repeats_run_all_chroms.sh 100000 /proj/uppstore2017185/b2014034_nobackup/Dasha/RepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai


makerrun3.all.nofasta.norepeats.doubleQC.CDS.gff


bash windowed_CDS_length_run_all_chroms.sh 2000000 /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/maker_run3/functional_annot/makerrun3.all.nofasta.norepeats.doubleQC.CDS.gff /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai


## Windowed GC content

bedtools makewindows -g /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_MAKER/input/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.fai -w 2000000 > GCA_905220365.1_ilVanCard2.1_genomic_chroms.2MB.windows.bed

bedtools nuc -fi GCA_905220365.1_ilVanCard2.1_genomic_chroms.fasta -bed GCA_905220365.1_ilVanCard2.1_genomic_chroms.2MB.windows.bed > GCA_905220365.1_ilVanCard2.1_genomic_chroms.2MB.GC.tsv




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


cat *genecount.tsv | sed '/chrom/d' > gene_density_100kb_doublQC.tsv


## Figuring out CDS




chrom begin end count_rpt length_rpt count_SINE length_SINE count_DNA length_DNA count_TcM length_TcM count_LINE length_LINE count_LTR length_LTR count_nonLTR length_nonLTR
LR999924.1 1 100000 181 78340
Fri Aug 20 12:40:32 CEST 2021
LR999924.1 1 100000 0
Fri Aug 20 12:40:34 CEST 2021
LR999924.1 1 100000 181 78340 0  22 2312 22 2312 36 10175 0 61056 72 61056
Fri Aug 20 12:40:41 CEST 2021
LR999924.1 100001 170000 129 30952
Fri Aug 20 12:40:42 CEST 2021
LR999924.1 100001 170000 4 1040
Fri Aug 20 12:40:44 CEST 2021
LR999924.1 100001 170000 129 30952 4 1040 17 3193 7 929 11 4408 3 15257 19 14690
Fri Aug 20 12:40:51 CEST 2021



count_rpt=$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
length_rpt=$(awk '$5 == a && $6>b && $7<c { count++ , sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

                echo "$line $begin $end $count_rpt $length_rpt"
                date

                count_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" $REP | wc -l)
                length_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

                echo "$line $begin $end $count_SINE $length_SINE"
                date

awk '$5 == LR999924.1 && $6>10000 && $7<20000 {count++ , sum+=$7-$6} END {print count, sum}' cdRepeatMasker_Vanessa/GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out

Simple_repeat


bash repeats_run_all_chroms.sh 100000 ../../../../GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out vanessa.index


**Resuming work**
20/01/22

awk -v OFS='\t' '{print $5,$6,$7,$11}' GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.elem_sorted.clean.out > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.elem_sorted.clean.bed

module load bioinfo-tools BEDTools/2.29.2

bedtools merge -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.elem_sorted.clean.bed  -c 4 -o distinct| tail -n 100

1. Check repeat content after "merge"
Ignore overlaps, but discuss in text

cp repeat_per_chromosome_beta.sh repeat_per_chromosome_beta_merged.sh

awk '$1 == a && $2>b && $3<c {sum+=$3-$2} END {print sum}'  a="$line" b="$begin" c="$end" GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.mergeonly.bed


LR999924.1      RepeatMasker    similarity      1       48       0.0    +       .       Target "Motif:(AACCT)n" 1 48
LR999924.1      RepeatMasker    similarity      59      98       2.5    +       .       Target "Motif:(T)n" 1 40
LR999924.1      RepeatMasker    similarity      99      821      7.1    -       .       Target "Motif:rnd-1_family-187" 2 729
LR999924.1      RepeatMasker    similarity      822     906      0.0    +       .       Target "Motif:(AACCT)n" 1 85
LR999924.1      RepeatMasker    similarity      908     1445    11.1    -       .       Target "Motif:rnd-5_family-2352" 1 567
LR999924.1      RepeatMasker    similarity      1461    6934    18.5    -       .       Target "Motif:rnd-1_family-349" 1 3814
LR999924.1      RepeatMasker    similarity      6875    7106    10.4    +       .       Target "Motif:rnd-1_family-305" 1 248
LR999924.1      RepeatMasker    similarity      7107    8661     0.0    +       .       Target "Motif:(AACCT)n" 1 1555
LR999924.1      RepeatMasker    similarity      8662    8698     0.0    +       .       Target "Motif:(T)n" 1 37
LR999924.1      RepeatMasker    similarity      8699    9437     6.6    -       .       Target "Motif:rnd-1_family-187" 2 748

bedtools merge -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -s -c 9 -o collapse > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.repeat.classes.out

paste GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.polish.gff GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.repeat.classes.out > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.polish.enriched.gff

bash repeat_per_chromosome_beta_merged.sh 200000 10000100 LR999925.1 GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.polish.enriched.out


    begin=10000
    end=100000
    end="${myArray[2]}"
    echo "$line"
    echo  "$begin $end"
    #echo "$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" repeat_annot_test.out | wc -l)"
    #length_rpt=$(awk '$1 == a && $2>b && $3<c {sum+=$3-$2} END {print sum}'  a="$line" b="$begin" c="$end" $REP)
    length_rpt=$(awk '{print b}' b="$begin" $REP)
    echo "#length_rpt"
    length_rpt2=$(awk '$1 == b {print $2}' b="$begin"  $REP)


    Vanessa_WindowRound2


 bedtools merge -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.gff -s -d 100 -c 10 -o collapse | head

awk ‘{a[$15]} END{for(rep in a){sum++}; print sum}'


RepeatMasker_Vanessa/03_RepeatMaskingVanessaArthropodDB

sort -u -k 14 -n GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.prot.gff | head

head -n 100 GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.prot.nodup.gff | sort -k 1 -k 4 -n > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.prot.nodup.sort.gff

bedtools merge -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.prot.nodup.sort.gff -d 10 -c 10 -o collapse

sort -k 1 -k 4 -n GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.prot.nodup.gff > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out.prot.nodup.sort.gff


cd /proj/uppstore2017185/b2014034_nobackup/Dasha/Vanessa_WindowRound2/

**new rpeat count class**

**LINEs**
grep "LINE" GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | sort -u -k 15 -n | awk -v OFS="\t" GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.LINE.bed
307000
bedtools sort -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.LINE.bed | bedtools merge -d 10 -c 10 -o collapse | head
bedtools sort -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.LINE.bed | bedtools merge -d 10 -c 4 -o collapse


grep "SINE" GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | sort -u -k 15 -n | awk -v OFS="\t" '{print $5,$6,$7,$11}' > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.SINE.bed
bedtools sort -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.SINE.bed | bedtools merge -d 10 -c 4 -o collapse > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.SINE.merge.out

bedtools sort -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.DNA.bed | bedtools merge -d 10 -c 4 -o collapse > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.DNA.merge.out

grep "LTR" GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | sort -u -k 15 -n | awk -v OFS="\t" '{print $5,$6,$7,$11}' > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.LTR.bed
bedtools sort -i GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.LTR.bed | bedtools merge -d 10 -c 4 -o collapse > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.LTR.merge.out


bash repeats_run_all_chroms_beta.sh 2000000 GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.LINE.merged.out vanessa.index

cat *out | awk -v OFS="\t" '{print $4}' > all.LINE.out
add header

bash repeats_run_all_chroms_beta.sh 2000000 GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.SINE.merged.out vanessa.index


cat *out | awk -v OFS="\t" '{print $4}' > all.SINE.out
cat *out | awk -v OFS="\t" '{print $4}' > all.DNA.out


sort -u -k 15 -n GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.out | awk -v OFS="\t" '{print $5,$6,$7,$11}' > GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.SINE.bed


bash repeats_run_all_chroms_beta.sh 100000 GCA_905220365.1_ilVanCard2.1_genomic_chroms.fna.SINE.merged.out vanessa.index

paste all.100kb.cds.out all.100kb.out all.LINE.100kb.out all.SINE.100kb.out all.DNA.100kb.out  
LR999935.1.CDS.tsv							all.DNA.100kb.out
LR999936.1-repeat-count.out						all.LINE.100kb.out
LR999936.1.CDS.tsv							all.LTR.100kb.out
LR999937.1-repeat-count.out						all.SINE.100kb.out
