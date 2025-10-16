#1 /bin/bash

#set a COUNTER equal to 0
COUNTER1=0
COUNTER2=10

#while the value of my counter is less than 150
while [ $COUNTER1 -lt 150 ]
do
	my_array[$COUNTER1]=$COUNTER2 #populate the element with the value o
	echo ${my_array[$COUNTER1]} >> my_array_list.txt #echo value of the 
	let COUNTER1=COUNTER1+1 #increase the COUNTER by 1
done
