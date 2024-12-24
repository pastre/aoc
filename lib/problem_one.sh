#!/bin/bash

sort_list() {
	sorted=$(echo $1 | tr , '\n' | sort -i -g | tr '\n' ,)
	echo ${sorted%?}
}

dist() {
	distance=$(( $1 - $2 ))
	echo "$distance" | sed 's/-//'
}

add() {
	result=$(( $1 + $2 ))
	echo $result
}
problem_one() {
	left_col="$1"
	right_col="$2"
	if [[ -z $left_col || -z $right_col ]]; then 
		echo 'Syntax error. Expected problem_one <left_list> <right_list> where lists are comma separated numbers. Example `problem_one 1,2,3 4,5,6`' >&2
		return 1
	fi
	sum=$(add $left_col $right_col)
	echo  $sum
}


