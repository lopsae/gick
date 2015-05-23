testRepo="testrepo_glist"

# Creates a repository with committed files, files with spaces, untracked
# files, etc.:
#
# testrepo
# ┣ firstfile  (commited)
# ┣ secondfile  (commited, modified)
# ┣ thirdfile  (commited, staged)
# ┣ fourth file  (commited, staged, modified)
# ┣ fifth file  (commited, delete staged)
# ┣ fifth new  (new staged, copy of fifth, appears as R on git status)
# ┣ sixth file  (commited, delete staged, modified)
# ┣ sixth new  (new staged, copy of sixth, appears as R on git status)
# ┣ seventh file (commited, delete staged)
# ┣ eigth file  (commited, deleted)
# ┣ ninth file (commited, delete staged, modified)
# ┣ tenth file (untracked)
# ┣ sub dir
# ┃ ┣ commited file (commited)
# ┃ ┣ modified file (modified)
# ┣ untracked
# ┃ ┣ commited file (commited)
# ┃ ┣ commited file (commited)
# ┗ empty (empty directory)

setup() {
	rm -rf $testRepo

	mkdir $testRepo
	cd $testRepo

	git init
	echo "first file" > firstfile
	echo "second file" > secondfile
	echo "third file" > thirdfile
	echo "fourth file" > fourthfile
	git add --all
	git commit -m "First commit"

	echo "first changed" > firstfile
	git stash save "first stash"

	echo "second changed" > secondfile
	git stash save "second stash"

	echo "third changed" > thirdfile
	git stash save "third stash"

	echo "fourth changed" > fourthfile
	echo "fifth file" > fifthfile
}


teardown() {
	cd ..
	rm -rf $testRepo
}


@test "TODO" {
	cosa='nostra'
	[[ $cosa == 'nostra' ]] || false
}