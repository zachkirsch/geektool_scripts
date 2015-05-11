MAX_LINES=$1
items=0
num_lines=$(/usr/local/bin/icalBuddy -n -nc -ss "" -npn firstItemLine -ec "Homework,Office Hours,To-Do List" -li $items eventsToday | wc -l)
if [ $num_lines -gt $MAX_LINES ]; then
	num_lines=0
	items=1
	while [ $num_lines -le $MAX_LINES ]
	do
		num_lines=$(/usr/local/bin/icalBuddy -n -nc -ss "" -npn firstItemLine -ec "Homework,Office Hours,To-Do List" -li $items eventsToday | wc -l)
        ((items++))
	done
	((items--))
	((items--))
fi

/usr/local/bin/icalBuddy -n -ss "" -npn -nc firstItemLine -ec "Homework,Office Hours,To-Do List" -li $items eventsToday
if [ -n $(/usr/local/bin/icalBuddy -n -nc -ss "" -npn firstItemLine -ec "Homework,Office Hours,To-Do List" -li $items eventsToday) ]; then
	echo "Nothing left to do today!"
fi
