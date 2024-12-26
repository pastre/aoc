sanitize() {
    while read line; do
        echo $line | grep -oE 'max\(0*[0-9]{1,3}\,0*[0-9]{1,3}\)'
    done
}
