awk '{if(NR>28) print $0}' $1 > ctd.csv
perl -MText::ParseWords -nle' @kata=parse_line(",", 1, $_); $|=1; $foo = 1; foreach(@kata) {if($foo==11) { printf  ("%s",$_) } else {printf  ("%s\t",$_) }; $foo++}; print "\n" ' ctd.csv > ctd2.csv
awk -F$'\t' '{print $1 "\t" $2 "\t" $4 "\t" $5 "\t" $7 "\t" $8 "\t" $11}'  ctd2.csv > ctd.csv
rm ctd2.csv 


