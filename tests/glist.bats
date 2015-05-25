
load sharedVars
load sharedSetup
load sharedTeardown


setup() {
	setupRepoAllStatus
}


teardown() {
	teardownRepo
}


@test "TODO" {
	cosa='nostra'
	[[ $cosa == 'nostra' ]] || false
}