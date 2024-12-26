sanitize() {
    while read line; do
        echo $line | grep -oE 'mul\(0*[0-9]{1,3}\,0*[0-9]{1,3}\)'
    done
}

mul() {
    echo "$(( $1 * $2 ))"
}

mul_expression() {
    while read expression; do
        product=$(echo $expression | sed -e 's/mul(//' -e 's/,/ /g' -e 's/)/ /g')
        mul $product
    done
}
