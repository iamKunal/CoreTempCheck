#!/bin/bash
red="\e[91m"
yel="\e[93m"
gre="\e[92m"
def="\e[39m"
tm=$(date '+%H:%M:%S')
dt=$(date '+%d/%m/%Y')
echo >> temps.log
echo "=======================================================" >> temps.log
echo "   Temperature Log started at ${tm} on ${dt}" >> temps.log
echo "=======================================================" >> temps.log
echo >> temps.log
while true
do
	clear
	echo
	echo
	echo ================================================================================
	echo
	echo -e "\e[95m\t\t   Core Temperature Checker Utility by Kunal\e[39m"
	echo
	echo ================================================================================
	echo
	for i in 0 1 2 3
	do
		C[$i+1]=`sensors | grep "Core ${i-1}"`
#		C[$i]=2
	done
	for i in 1 2 3 4
	do
		a=${C[$i]}
		b=${a:17:6}
		t=${a:17:2}
		B[$i]=${b}
		T[$i]=${t}
	done
#	echo ${B[*]}
#	echo ${T[*]}
	for i in 1 2 3 4
	do
		if (( T[$i] > 50 )); then
			c=${B[$i]}
			c="${red}${c}"
			tm=$(date '+%H:%M:%S')
			dt=$(date '+%d/%m/%Y')
			echo "Core ${i} temperature was ${B[$i]} at ${tm} on ${dt}" >> temps.log
			echo >> temps.log
			notify-send -u critical "Core ${i} temperature is ${B[$i]}"
		else
			if (( T[$i] > 45 )); then
				c=${B[$i]}
				c="${yel}${c}"
			else if (( T[$i] > 40 )); then
				c=${B[$i]}
				c="${gre}${c}"
				else
					c=${B[$i]}
					c="${def}${c}"
				fi
			fi
		fi
		c="${c}${def}"
		A[$i]=${c}
	done
	for i in 1 2 3 4
	do
		echo -e "\t\t\tCore ${i} :\t\t${A[$i]}\n"
	done
#	echo -e ${A[*]}
	sleep 1
done

