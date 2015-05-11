MAX_LINES=$1
extra_days=$2
items=0
num_lines=$(/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ic Homework -li $items eventsFrom:Today to:Tomorrow+$extra_days | wc -l)
if [ $num_lines -gt $MAX_LINES ]; then
	num_lines=0
	items=1
	while [ $num_lines -le $MAX_LINES ]
	do
		num_lines=$(/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ic Homework -li $items eventsFrom:Today to:Tomorrow+$extra_days | wc -l)
        ((items++))
	done
	((items--))
	((items--))
fi

/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ic Homework -li $items eventsFrom:Today to:Tomorrow+$extra_days
if [ -n $(/usr/local/bin/icalBuddy -sd -ss "" -eep "*" -nc -ic Homework -li $items eventsFrom:Today to:Tomorrow+$extra_days) ]; then
	echo "No homework due!"
fi
