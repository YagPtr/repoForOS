
read -r currentname


maxName=$currentname
minName=$currentname

whatever="x"

#я не понимаю почему оно не работает с целочисленной переменной

arrOfMax+=($currentname)
arrOfMin+=($currentname)


while read -r currentname;
do	
	if [ ${#currentname} -gt ${#maxName} ]
	then
		maxName=${currentname}
		unset arrOfMax
		arrOfMax+=($currentname)
	elif [ ${#currentname} -eq ${#maxName} ]
	then
		arrOfMax+=($currentname)
	elif [ ${#currentname} -eq ${#minName} ]
	then
		arrOfMin+=($currentname)	
	elif [ ${#currentname} -lt ${#minName} ] && [ ${#currentname} -gt ${#whatever} ]
	then
			minName=${currentname}
			unset arrOfMin
			arrOfMin+=($currentname)
	fi
	
done


echo "Min Inits are " with length of ${#minName} are 

for i in ${arrOfMin[*]}
do
	echo $i
done

echo "Max Inits are " with length of ${#maxName} are


for i in ${arrOfMax[*]}
do
	echo $i
done
