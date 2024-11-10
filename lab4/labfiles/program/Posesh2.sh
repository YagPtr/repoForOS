#xd=$(sed 's/.* //' Пивоварение/A-06-21-attendance)



while read -r i;
do
	xdd=${#i}

	for ((j=0;j< $xdd;j++))
	do	
		if [ ${i:j:1} == '+' ]
			then 
				((plus[j]++))
				((minus[j]+=0))
			else 
				((minus[j]++))
				((plus[j]+=0))
		fi
		
	done
	
done






max=0
min=52

for i in ${plus[*]}
do
	if [ $i -gt $max ]
	then 
		max=$i
	elif [ $i -lt $min ]
	then
		min=$i
	fi
done

echo "min" $min
echo "max" $max




			
line=2 

if [ $line = 1 ] || [ $line = 3 ]
then 	
	for ((j=0;j< $xdd;j++))
		do	
	
		if [ ${plus[j]} = $max ]
		then
			xd=$j
			((xd++))
			echo "максимум студентов на занятии" $xd
		fi
		done
fi


if [ $line = 2 ] || [ $line = 3 ]
then 	
	for ((j=0;j< $xdd;j++))
		do	
	
		if [ ${plus[j]} = $min ]
		then
			xd=$j
			((xd++))
			echo "минимум студентов на занятии" $xd
		fi
		done
fi


