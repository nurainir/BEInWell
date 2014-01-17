
while read line
	do
			#split by tab
	arr=(${line//'\t'/ })
	wget http://www.healthandenvironment.org/tddb/contam/?itemid=${arr[0]} -O tox
	name=${arr[1]}
	awk -v name=$name 'BEGIN{data=""}
	{if (data=="" && $0 !~ /^<p><strong>/ )
	 next
	 else if($0 ~ /^<p><strong>/)
	 data=$0
	else if(data!="" && $0 ~ /margin\-bottom/ )
		{
		print $0		
		print name "\t" data "\t" $0 >> "toxic"
		}
	 }' tox
	sleep 5

done < $1


	    
