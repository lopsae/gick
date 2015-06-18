
setup() {
	true
}


teardown() {
	true
}


# pick tests run from the root of the repository
pick='./pick'


@test 'help and basic errors' {
	# No stdin
	run $pick
	[[ $status -gt 0 ]] || false

	run $pick -D
	[[ $status -gt 0 ]] || false

	# Helpdocs
	helpDocRegex='^NAME[[:space:]]+pick'
	[[ $($pick -h) =~ $helpDocRegex ]] || false

	# Stdin, but no parameters
	run 'echo something | $pick'
	[[ $status -gt 0 ]] || false
}


@test 'basic picking' {
	input=$'Blood orange\nGreen apple\nRed apple'

	# Basic picks
	[[ $(echo "$input" | $pick orange) == 'Blood orange' ]] || false
	[[ $(echo "$input" | $pick ple) == 'Green apple' ]] || false
	[[ $(echo "$input" | $pick ree pp) == 'Green apple' ]] || false
	[[ $(echo "$input" | $pick red app) == 'Red apple' ]] || false

	# First pick of two possible options
	[[ $(echo "$input" | $pick app) == 'Green apple' ]] || false
	[[ $(echo "$input" | $pick r a) == 'Blood orange' ]] || false

	# Existing substrings but with incorrect order
	run 'echo "$input" | $pick app reen'
	[[ $status -gt 0 ]] || false
	run 'echo "$input" | $pick ple ed'
	[[ $status -gt 0 ]] || false

	# No matches
	run 'echo "$input" | $pick xxx'
	[[ $status -gt 0 ]] || false

	run 'echo "$input" | $pick a b c'
	[[ $status -gt 0 ]] || false
}


@test 'case auto ignore' {
	input=$'Red\nGreen'

	# -c option to force finding lowercase
	[[ $(echo "$input" | $pick r) == 'Red' ]] || false
	[[ $(echo "$input" | $pick R) == 'Red' ]] || false
	[[ $(echo "$input" | $pick -c r) == 'Green' ]] || false

	input=$'Green\nRed'

	# Using upper case forces to find correct case
	[[ $(echo "$input" | $pick r) == 'Green' ]] || false
	[[ $(echo "$input" | $pick R) == 'Red' ]] || false

	# Force find correct case when there is none
	[[ $(echo "Ego" | $pick e) == 'Ego' ]] || false
	[[ $(echo "Ego" | $pick E) == 'Ego' ]] || false
	run 'echo "Ego" | $pick -c e)'
	[[ $status -gt 0 ]] || false

	[[ $(echo "Ego" | $pick o) == 'Ego' ]] || false
	run 'echo "Ego" | $pick O)'
	[[ $status -gt 0 ]] || false
}


# TODO tests -a option
# test that order of returned is the same as input

# TODO tests using ^ and $ for using them in regex


# TODO test debug option prints the regex
# test that regex is printed even if there are no matches
