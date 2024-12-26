sanitize() {
    while read line; do
        echo $line | grep -oE 'mul\(0*[0-9]{1,3}\,0*[0-9]{1,3}\)'
    done
}

mul() {
    echo "$(( ${1:-0} * ${2:-0} ))"
}

add() {
    echo "$(( $1 + $2 ))"
}

mul_expression() {
    while read expression; do
        product=$(echo $expression | sed -e 's/mul(//' -e 's/,/ /g' -e 's/)/ /g')
        mul $product
    done
}

problem_one() {
    declare -i sum
    sum=0
    while read corrupted_input; do
        sanitized=$(echo $corrupted_input | sanitize)
        product=$(echo "$sanitized" | mul_expression)
        input_sum=$(echo $product | sed -e 's/\n/ /g' -e 's/ /+/g' | bc)
        sum=$( add $sum $input_sum )
    done
    echo $sum
}
