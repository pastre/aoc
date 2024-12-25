dist() {
	distance=$(( $1 - $2 ))
	echo "$distance" | sed 's/-//'
}

has_safe_direction() {
    changes=$(mark_direction_changes $@ | uniq | wc -l | xargs)
    if (( $changes == 1 )); then
        echo 'safe'
    else
        echo 'unsafe'
    fi
}

mark_direction_changes() {
    if ((  $# < 2 )); then
        return 0
    fi

    diff=$(( $1 - $2 ))
    if [ $diff -eq 0 ]; then 
        echo 'unsafe'
        return 0
    elif [ $diff -lt 0 ]; then
        echo 'l'
    elif [ $diff -gt 0 ]; then
        echo 'g'
    fi
    
    shift
    next=$(mark_direction_changes $@)
    echo "$next" 
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

