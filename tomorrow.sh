MAX_LINES=$1
items=0
num_lines=$(/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ec "Homework,Office Hours,To-Do List" eventsFrom:Tomorrow to:Tomorrow | wc -l)
if [ $num_lines -gt $MAX_LINES ]; then
	/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ec "Homework,Office Hours,To-Do List" eventsFrom:Tomorrow to:Tomorrow | head -9
	echo "[More...]"
elif [ -n $(/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ec "Homework,Office Hours,To-Do List" eventsFrom:Tomorrow to:Tomorrow) ]; then
	echo "Nothing on the schedule tomorrow!"
else
	/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ec "Homework,Office Hours,To-Do List" eventsFrom:Tomorrow to:Tomorrow | head -10
fi
