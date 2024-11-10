
read -r currentname

maxVal=1

curVal=1

loh=$currentname

arrLohs+=($currentname)

while read -r line;
do	
	if [ ${currentname} == ${line} ]
	then
		((curVal++))
	else

		if [ $curVal -gt $maxVal ]
		then 
			unset arrLohs
			maxVal=$curVal
			arrLohs+=($currentname)
		elif [ $curVal -eq $maxVal ]
		then
			arrLohs+=($currentname)
			
		fi
		currentname=$line
		curVal=1
	
	fi
done

echo "students with the most amount of bad marks of" $maxVal "are"

for i in ${arrLohs[*]}
do
	echo $i
done


