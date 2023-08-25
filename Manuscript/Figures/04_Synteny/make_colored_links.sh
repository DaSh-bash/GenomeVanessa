while IFS=$'\t' read -r -a myArray
do
	for line in "${myArray[0]}"
	do
		chrcolor="${myArray[2]}"
		color_line =$(awk '$4==a {print $0" color="b}' a="$line" b="$chrcolor" hmel_vca.links)
		echo "$color_line"

		#begin="${myArray[1]}"
	#	end="${myArray[2]}"
		#echo "$(awk '$5 == a && $6>b && $7<c {print}'  a="$line" b="$begin" c="$end" repeat_annot_test.out | wc -l)"
	#	count_rpt=$(awk '$5 == a && $6>b && $7<c {count++; sum+=$7-$6} END {print count, sum}'  a="$line" b="$begin" c="$end" $REP)
		#length_rpt=$(awk '$5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

	#	count_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {count++; sum+=$7-$6} END {print count, sum}'  a="$line" b="$begin" c="$end" $REP )
#               length_SINE=$(awk '/SINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

	#	count_LINE=$(awk '/LINE/ && $5 == a && $6>b && $7<c {count++; sum+=$7-$6} END {print count, sum}'  a="$line" b="$begin" c="$end" $REP)
#               length_LINE=$(awk '/LINE/ && $5 == a && $6>b && $7<c {sum+=$7-$6} END {print sum}'  a="$line" b="$begin" c="$end" $REP)

		#echo "$line $begin $end $count_rpt $count_SINE $count_DNA $count_TcMar $count_LINE $count_LTR $count_nonLTR $count_simrep"
#		echo "$line $begin $end $count_rpt" # $length_rpt $count_SINE $length_SINE $count_DNA $length_DNA $count_TcMar $length_TcMar $co$

	done
done < vanessa_color.map
#rm *tmp
