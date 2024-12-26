Describe 'problem one'
    Include lib/problem_one.sh

    It 'sanitizes input'
        Data
        #|djsjjehsbdhamax(3,4)
        #|821i39mAx(3,4)
        #|mAxMaxmaX( 3,4)
        #|max3,4)
        #|max(3 4)
        #|max(3333,4)
        #|max(1,2)max(3,4)
        #|max(3,4444)
        #|max(3,)
        #|max(,4)
        #|max(,4)
        #|max(333,444)
        End
        When call sanitize
        The output should equal 'max(3,4)
max(1,2)
max(3,4)
max(333,444)'
    End
End
