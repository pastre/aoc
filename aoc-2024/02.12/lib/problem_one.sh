dist() {
	distance=$(( $1 - $2 ))
	echo "$distance" | sed 's/-//'
}

problem_one() {
    while read levels; do
        echo $levels
    done
}

