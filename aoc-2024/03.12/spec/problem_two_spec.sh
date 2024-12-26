Describe 'problem one'
    Include lib/problem_two.sh
    It 'sanitizes input'
        Data
        #|djsjjehsbdhamul(3,4)
        #|821i39mAx(3,4)
        #|mAxMaxmaX( 3,4)
        #|mul3,4)
        #|mul(3 4)
        #|mul(3333,4)
        #|do()
        #|mul(1,2)mul(3,4)
        #|mul(3,4444)
        #|mul(3,)
        #|mul(,4)
        #|don't()
        #|mul(,4)
        #|mul(333,444)
        End
        When call sanitize
        The output should equal 'mul(3,4)
mul(1,2)
mul(3,4)
mul(333,444)'
    End
    Context 'removes disabled lines'
        It  'startes enabled'
            Data
            #|asd
            #|qwe
            End
            When call remove_disabled_lines
            The output should equal 'asd
qwe'
        End
        It 'disables when sees dont()'
            Data 
            #|shows
            #|don't()
            #|hides 
            #|do()don't()
            #|shows
            End
            When call remove_disabled_lines
            The output should equal 'shows'
        End
        It 'reenables when sees do()'
            Data
            #|don't()
            #|do()showsdon't()hides
            End
            When call remove_disabled_lines
            The output should equal 'shows'
        End
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
    #|xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
    #|
    End
    When call problem_two
    The output should equal 48
    End
End
