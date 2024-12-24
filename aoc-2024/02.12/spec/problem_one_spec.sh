Describe 'problem one'
    Include lib/problem_one.sh
    It 'calculates distance'
        When call dist 13 5
        The output should equal 8 
    End
    It 'handles negative distances'
        When call dist 5 13
        The output should equal 8
    End
    It 'reads from stdin'
        Data    
        #| 1 2 3
        End
        When call problem_one
        The output should equal '1 2 3'
    End
End
