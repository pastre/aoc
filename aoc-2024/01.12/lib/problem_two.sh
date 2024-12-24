count_freq() {
	echo $2 | grep -o $1 | wc -l | xargs
}


add() {
	result=$(( $1 + $2 ))
	echo $result
}

run() {
	declare -i sum
	right_list="$(cat $2)"
	sum=0
	while read number; do
		freq=$(count_freq $number "$right_list")
		sum=$(add $sum $freq)	
	done <<< "$(cat "$1" | sed 's/ /\n/g')"
	echo "$sum"
}



