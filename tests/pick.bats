
setup() {
	true
}


teardown() {
	true
}


@test 'help and basic errors' {
	# No stdin
	run pick
	[[ $status -gt 0 ]] || false

	run pick -D
	[[ $status -gt 0 ]] || false

	# Helpdocs
	helpDocRegex='^NAME[[:space:]]+pick'
	[[ $(pick -h) =~ $helpDocRegex ]] || false

	# Stdin, but no parameters
	run 'echo something | pick'
	[[ $status -gt 0 ]] || false
}


@test 'basic picking' {
	input=$'Blood orange\nGreen apple\nRed apple'

	# Basic picks
	[[ $(echo "$input" | pick orange) == 'Blood orange' ]] || false
	[[ $(echo "$input" | pick ple) == 'Green apple' ]] || false
	[[ $(echo "$input" | pick ree pp) == 'Green apple' ]] || false
	[[ $(echo "$input" | pick red app) == 'Red apple' ]] || false

	# First pick of two possible options
	[[ $(echo "$input" | pick app) == 'Green apple' ]] || false
	[[ $(echo "$input" | pick r a) == 'Blood orange' ]] || false

	# Existing substrings but with incorrect order
	run 'echo "$input" | pick app reen'
	[[ $status -gt 0 ]] || false
	run 'echo "$input" | pick ple ed'
	[[ $status -gt 0 ]] || false

	# No matches
	run 'echo "$input" | pick xxx'
	[[ $status -gt 0 ]] || false

	run 'echo "$input" | pick a b c'
	[[ $status -gt 0 ]] || false
}