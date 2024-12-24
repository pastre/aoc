#!/bin/bash

sort_list() {
	sorted=$(echo $1 | tr ' ' '\n' | sort -i -g | tr '\n' ' ')
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

write_list() {
	input="$1"
	for (( i=1; i <= "$#"; i++ )); do
	    echo "${!i}" >> .tmp/${i}
	done
}

problem_one() {
	rm .tmp/* 2>/dev/null || mkdir -p .tmp || true

	left_col=$(echo $1 | sed 's/,/ /g')
	right_col=$(echo $2 | sed 's/,/ /g')
	if [[ -z $left_col || -z $right_col ]]; then 
		echo 'Syntax error. Expected problem_one <left_list> <right_list> where lists are comma separated numbers. Example `problem_one 1,2,3 4,5,6`' >&2
		return 1
	fi

	
	left_list=$(sort_list "$left_col")
	right_list=$(sort_list "$right_col")
	
	write_list $left_list
	write_list $right_list
	
	sum=0
	for pair in .tmp/*; do
		distance_args=$(cat $pair | tr '\n' ' ')
		distance=$(dist $distance_args)
		sum=$(add sum distance)	
	done	

	echo  $sum
}

${__SOURCED__:+return}
echo started
left_col=""
right_col=""
echo reading
while read line; do
	left_number=$(echo $line | sed 's/ .*//g')
	right_number=$(echo $line | sed 's/.* //g')
	left_col+="$left_number," 
	right_col+="$right_number," 
done < input
echo 'read'
problem_one $left_col $right_col

echo



