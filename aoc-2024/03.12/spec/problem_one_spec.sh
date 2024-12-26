Describe 'problem one'
    Include lib/problem_one.sh

    It 'sanitizes input'
        Data
        #|djsjjehsbdhamul(3,4)
        #|821i39mAx(3,4)
        #|mAxMaxmaX( 3,4)
        #|mul3,4)
        #|mul(3 4)
        #|mul(3333,4)
        #|mul(1,2)mul(3,4)
        #|mul(3,4444)
        #|mul(3,)
        #|mul(,4)
        #|mul(,4)
        #|mul(333,444)
        End
        When call sanitize
        The output should equal 'mul(3,4)
mul(1,2)
mul(3,4)
mul(333,444)'
    End
    It 'returns zero with missing arg'
        When call mul 3
        The output should equal 0
    End
    It 'multiplies numbers'
        When call mul 3 4
        The output should equal 12
    End
    It 'multiplies expressions'
        Data
        #|mul(3,4)
        End
        When call mul_expression <<< 'mul(3,4)'
        The output should equal 12
    End

    It 'sums and multiplies expressions'
    Data
    #|xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
    #|
    #|
    End
    When call problem_one
    The output should equal 161
    End
End
