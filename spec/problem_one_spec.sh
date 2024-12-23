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
	It 'sums two integers'
		When call problem_one 2 3
		The output should equal 5
	End
End

