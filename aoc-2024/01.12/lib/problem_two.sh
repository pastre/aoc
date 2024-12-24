#!/bin/bash

TMPBASE=".tmp/problem_two"

count_freq() {
	echo $2 | grep -o $1 | wc -l | xargs
}


add() {
	result=$(( $1 + $2 ))
	echo "$result"
}

mul() {
	result=$(( $1 * $2 ))
	echo "$result"
}


problem_two() {
	right_list="$(cat $2)"
	declare -i sum
	sum=0
	while read number; do
		freq=$(count_freq $number "$right_list")
		similarity_score_increase=$(mul $number $freq)
		sum=$(add $sum $similarity_score_increase)	
	done <<< "$(cat "$1" | sed 's/ /\n/g')"
	echo "$sum"
}

${__SOURCED__:+return}

rm -rf $TMPBASE/**/* || true
mkdir -p $TMPBASE/../
mkdir -p $TMPBASE

echo reading
while read line; do
	left_number=$(echo $line | sed 's/ .*//g')
	right_number=$(echo $line | sed 's/.* //g')
	echo -n "$left_number " >> "$TMPBASE/left_col" 
	echo -n "$right_number " >> "$TMPBASE/right_col"
done < input
echo 'read'

problem_two $TMPBASE/left_col $TMPBASE/right_col

