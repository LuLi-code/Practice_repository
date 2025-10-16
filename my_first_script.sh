#1 /bin/bath

# add header line
echo "There are my friends" > myfirends.txt

# set a counter equal to 1
COUNTER=1

# run for loop on list of friends
for FRIEND in Elie Hasita Juhi Jon Lu Caroline
do
	echo $FRIEND >> myfriends.txt
	echo "on friends number $COUNTER" >> myfriends.txt
	((COUNTER++)) #increase my counter by 1
done

echo "For loop completed"

# decrease counter by 1 to get accurate count	
((COUNTER--))

# echo total number of friends 
echo "Total Number of Friends: $COUNTER" >> myfriends.txt

# echo completion to standard out
echo "Script Completd"

