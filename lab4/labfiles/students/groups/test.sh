
read -r currentname


maxName=$currentname
minName=$currentname

whatever="x"

#я не понимаю почему оно не работает с целочисленной переменной


while read -r currentname;
do	
	if [ ${#currentname} -gt ${#maxName} ]
	then
		maxName=${currentname}
		echo "Max name have been changed"
	elif [ ${#currentname} -lt ${#minName} ] && [ ${#currentname} -ge ${#whatever} ]
	then
			minName=${currentname}
			echo "Min name have been changed"
	fi
done

echo $maxName
echo $minName