% TMPBASE: "$SHELLSPEC_TMPBASE/.tmp/problem_two"

Describe 'part_two.sh'
	Include lib/problem_two.sh
	It 'counts frequencies'
		When call count_freq 3 "3 3 3"
		The output should equal 3
	End
	It 'multiplies'
		When call mul 3 3
		The output should equal 9
	End
	It 'sums and multiplies frequencies'
		mkdir -p $TMPBASE/../
		mkdir -p $TMPBASE
		mkdir -p "$TMPBASE/test"
		echo '3 2 3' > $TMPBASE/test/sums_freq_left
		echo '3 3 3' > $TMPBASE/test/sums_freq_right
		When call problem_two $TMPBASE/test/sums_freq_left $TMPBASE/test/sums_freq_right
		The output should equal 18
	End
End

