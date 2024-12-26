dist() {
	distance=$(( $1 - $2 ))
	echo "$distance" | sed 's/-//'
}

has_safe_direction() {
    changes=$(mark_direction_changes $@ | uniq | wc -l | xargs)
    if [ $changes -lt 2 ]; then
        echo 'safe'
    else
        echo 'unsafe'
    fi
}

mark_direction_changes() {
    if ((  $# < 3 )); then
        return 0
    fi

    diff=$(( $1 - $2 ))
    tolerated=$(( $1 - $3 ))
    if [ $diff -eq 0 ] && [ $tolerated -eq 0 ]; then 
       echo 'unsafe'
       echo 'untolerated'
    elif [ $diff -lt 0 ] || [ $tolerated -lt 0 ]; then
        echo 'l'
    elif [ $diff -gt 0 ] || [ $tolerated -gt 0 ]; then
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

problem_two() {
    declare -i sum
    sum=0
    while read levels; do
        if [ "$(has_safe_direction $levels)" == 'unsafe' ]; then continue; fi
        if [ "$(has_safe_distances $levels)" == 'unsafe' ]; then continue; fi
        sum=$(( sum + 1 ))
    done
    echo $sum
}

