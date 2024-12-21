Describe 'problem_one.sh'
	Include 'lib/problem_one.sh'
	It 'fails without list one'
		When call problem_one
		The output should equal 'Expected syntax: problem_one <list_one> <list_two> where lists are comma separated numbers. Example `problem_one` 1,2,3 4,5,6'
	End
	It 'fails without list two'
		When call problem_one 1,2,3
		The output should equal 'Expected syntax: problem_one <list_one> <list_two> where lists are comma separated numbers. Example `problem_one` 1,2,3 4,5,6'
	End
End

