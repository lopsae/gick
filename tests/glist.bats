
load sharedVars
load sharedSetup
load sharedTeardown


setup() {
	setupRepoAllStatus
}


teardown() {
	true
	teardownRepo
}


@test 'help and basic errors' {
	# Helpdocs
	helpDocRegex='^NAME[[:space:]]+glist'
	[[ $(../glist -h) =~ $helpDocRegex ]] || false

	# There is some output
	[[ ! -z $(../glist) ]] || false

	# Trying to select files that do not exist
	run ../glist unexistent
	[[ $status -gt 0 ]] || false

	run 'echo unexistent | ../glist'
	[[ $status -gt 0 ]] || false
}


@test 'basic status' {
	run ../glist

	echo "$output" | grep '^ M workspaceChanged'
	echo "$output" | grep '^M  stagedChange'
	echo "$output" | grep '^MM stagedChangeChanged'
	echo "$output" | grep '^MD stagedChangeDeleted'

	echo "$output" | grep '^ D workspaceDeleted'
	echo "$output" | grep '^D  stagedDelete'

	# TODO this status is invalid until glist handles status natively
	# echo "$output" | grep '^D? stagedDeleteNew'

	# TODO same with this, invalid until glist is redone
	# echo "$output" | grep '^ ? workspaceNew'
	echo "$output" | grep '^A  stagedNew'
	echo "$output" | grep '^AM stagedNewChanged'
	echo "$output" | grep '^AD stagedNewDeleted'
}

