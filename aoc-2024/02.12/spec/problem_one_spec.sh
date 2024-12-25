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
    It 'flags unsafe when direction does not change'
        When call has_safe_direction 1 2 3 3
        The output should equal unsafe
    End
    It 'flags safe when direction increases'
        When call has_safe_direction 1 20 34 565
        The output should equal safe
    End
    It 'flags unsafe when direction starts decreasing but increases'
        When call has_safe_direction 5 4 3 4 2 1
        The output should equal unsafe
    End
    It 'flags unsafe when direction starts increasing but decreases'
        When call has_safe_direction 1 2 3 2 4
        The output should equal unsafe
    End
    It 'flags unsafe increasing distances'
        When call has_safe_distances 1 2 7 8 9
        The output should equal 'unsafe'
    End
    It 'flags unsafe decreasing distances'
        When call has_safe_distances 9 7 6 2 1
        The output should equal 'unsafe'
    End
    It 'calculates increasing distances'
        When call has_safe_distances 1 3 6 7 9
        The output should equal 'safe'
    End
    It 'calculates decreasing distances'
        When call has_safe_distances 7 6 4 2 1
        The output should equal 'safe'
    End
End
