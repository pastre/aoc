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
End
