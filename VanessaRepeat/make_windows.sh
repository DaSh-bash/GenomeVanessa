seq 1 $1 $2 > begin.tmp
seq $1 $1 $2 > end.tmp
yes "$3" | head -n $4 > chrom.tmp
paste chrom.tmp begin.tmp end.tmp 
rm *tmp

