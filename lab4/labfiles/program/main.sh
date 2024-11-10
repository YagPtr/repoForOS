line="xd"
cd ..
echo hi $(whoami)
while [ $line != "end" ];
#while true;

do
	echo "list of commands:"
	echo "1 - вывод студентов с максимальной и минимальной длиной ФИО"
	echo "2 - вывод имени студента с наибольшим количеством неудачных попыток сдачи тестов"
	echo "3 - вывод статистики посещения занятия по группе"
	echo "end - выход из программы"
	read -r line
	while [ ${#line} -lt 1 ]
	do	
		echo "введите корректную команду"
		read -r line
	done
	
	if [ $line = "1" ]
		then
			echo "введите номер группы"
			read -r lineGroup;
			xd=$(cat students/groups/$lineGroup 2>trash)
			rm trash
			if [ ${#xd} -ge 1 ]
			then 
				cat students/groups/$lineGroup | sh program/Names.sh
			else
				echo "не существует группы" $lineGroup
			fi
	elif [ $line = "2" ]
		then  
			

			echo "введите номер группы"
			read -r lineGroup;
			xdd=$(echo $lineGroup | grep -e A-0[69]-[0-9][0-9] -e Ae-21-21)
			
			if [ ${#xdd} -ge 1 ] 
			then
				xd=$(grep $lineGroup */tests/* )
				if [ ${#xd} -ge 1 ]
				then 
					grep $lineGroup */tests/* -h| sed 's/[0-9]*,//;/[3-5]$/d;s/,.*//' | sort | sh program/Loh.sh
				else
					echo "не существует данных о группе" $lineGroup
				fi
			else 
				echo "не существует группы" $lineGroup
			fi
			
	elif [ $line = "3" ]
		then  
			echo "доступные директории:"
			echo $(ls | grep -v students | grep -v program | grep -v '\.')
			echo "введите название предмета"
			read -r lineSub;
			echo "введите номер группы"
			read -r lineGroup;
			xdd=$(echo $lineGroup | grep -e A-0[69]-[0-9][0-9] -e Ae-21-21)
			grepForSub=$(ls | grep \^$lineSub\$)
			
		if [ ${#grepForSub} -ge 1 ]
		then
			if [ ${#xdd} -ge 1 ] 
			then
				xd=$(ls students/groups/ | grep $lineGroup)
				if [ ${#xd} -ge 1 ]
				then 
					echo "1 - только максимум"
					echo "2 - только минимум"
					echo "3 - максимум и минимум"
					read -r line2;
					if [ $line2 = 3 ]
					then
						echo "for" $lineSub "subject"
						sed 's/.* //' $lineSub/$lineGroup-attendance  | sh program/Posesh3.sh

					elif [ $line2 = 2 ]
					then 
						echo "for" $lineSub "subject"
						sed 's/.* //' $lineSub/$lineGroup-attendance  | sh program/Posesh2.sh

					elif [ $line2 = 1 ]
					then
						echo "for" $lineSub "subject"
						sed 's/.* //' $lineSub/$lineGroup-attendance  | sh program/Posesh1.sh
		
					fi
				else
					echo "не существует группы" $lineGroup
				fi
			else 
				echo "не существует группы" $lineGroup
			fi
		else echo "не существует предмета" $lineSub
		fi
	fi
echo "<--------------->"
done
rm program/trash
echo "всего хорошего"