## Description of coverage report

- Total coverage percentage, this is the total number of lines covered by a test divided by the total number of lines requiring testing.
- File = Name of the file, the code coverage is calculated per file.
- Lines = Number of lines in the file, corresponds to the number of lines inside the file.
- Relevant = Corresponds to the lines of code to be tested (i.e. the lines inside the function brackets with the brackets and comments removed).
- Covered = Number of lines covered by a test
- Missed = Number of lines not covered by a test
- Hits/Line = Corresponds to the average number of times specific lines are tested in the file.
    + In other words, if I have an 11-lines file where (1) the first 6 lines are tested 4 times, (2) the seventh is tested 1 time, (3) the last 4 are tested 10 times. The calculation is then: ((6 * 4) + 1 + (10 * 4))/11 = 6. This gives the average number of times a line is tested, here 6. 
- Coverage = corresponds to the percentage of lines covered by a test. Calculation: Covered / Relevant * 100, number of lines covered by a test divided by the number of lines requiring testing.
- If we go into detail by file, the color code is as follows:
    - green line = line tested by at least one test (the x? corresponds to the number of times the line is tested)
    - red line = line not covered by a test
    - white line = lines not to be tested (comments, ...)
