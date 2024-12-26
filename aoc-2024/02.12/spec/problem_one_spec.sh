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
    It 'counts safe rows'
        Data    
        #|7 6 4 2 1
        #|1 2 7 8 9
        #|9 7 6 2 1
        #|1 3 2 4 5
        #|8 6 4 4 1
        #|1 3 6 7 9
        #|16 16 17 18 21 24 22
        End
        When call problem_one
        The output should equal 2
    End
    It 'flags unsafe when direction does not change'
        When call has_safe_direction 16 16 17 18 21 24 22
        The output should equal unsafe
    End
    It 'flags safe when direction increases'
        When call has_safe_direction  70 77 79 80 82 83 88
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
        When call has_safe_distances 15 18 21 22 25 26 30
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
