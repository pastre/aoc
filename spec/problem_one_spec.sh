Describe 'problem_one.sh'
	Include lib/problem_one.sh
	Context 'invalid inputs'
		It 'fails without list one'
			When call problem_one
			The status should be failure
			The stderr should include 'Syntax error. Expected problem_one <left_list> <right_list> where lists are comma separated numbers. Example `problem_one 1,2,3 4,5,6`'
		End
		It 'fails without list two'
			When call problem_one 1,2,3
			The status should be failure
			The error should equal 'Syntax error. Expected problem_one <left_list> <right_list> where lists are comma separated numbers. Example `problem_one 1,2,3 4,5,6`'
		End
	End
	Context 'unit tests'
		It 'sums two integers'
			When call add 2 3
			The output should equal 5
		End
       	It 'sorts'
       		When call sort_list "3 2 4 1"
       		The output should equal "1 2 3 4"
       	End
       	It 'breaks lists into files'
       		When call write_list 1 2 3 4
       		The contents of file '.tmp/1' should equal '1'
       		The contents of file '.tmp/2' should equal '2'
       		The contents of file '.tmp/3' should equal '3'
       		The contents of file '.tmp/4' should equal '4'
       	End
		It 'calculates distance'
			When call dist 13 5
			The output should equal 8 
		End
		It 'handles negative distances'
			When call dist 5 13
			The output should equal 8
		End
	End

	Context 'Integration tests'
		It 'sorts calculates distances and sums'
			When call problem_one 3,5,4 6,1,6
			The output should equal 5
		End	
	End
End

