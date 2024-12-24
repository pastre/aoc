dist() {
	distance=$(( $1 - $2 ))
	echo "$distance" | sed 's/-//'
}

has_safe_distances() {
    if (( $# < 2 )); then
        echo 'safe'
        return 0
    fi
    current=$(dist $1 $2)
    if [ $current -gt 3 ]; then
        echo "unsafe"
        return 0;
    fi
    shift
    has_safe_distances $@ 
}

problem_one() {
    while read levels; do
        echo $levels
    done
}

