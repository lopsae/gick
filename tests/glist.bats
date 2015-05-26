
load sharedVars
load sharedSetup
load sharedTeardown


setup() {
	setupRepoAllStatus
}


teardown() {
	teardownRepo
}


@test 'help and basic errors' {
	# Helpdocs
	helpDocRegex='^NAME[[:space:]]+glist'
	[[ $(../glist -h) =~ $helpDocRegex ]] || false

	# There is some output
	[[ ! -z $(../glist) ]] || false

	# Trying to select files that do not exist
	run ./glist unexistent
	[[ $status -gt 0 ]] || false

	run 'echo unexistent | ../glist'
	[[ $status -gt 0 ]] || false
}

