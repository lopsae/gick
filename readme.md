gick
====


Quick setup
-----------

Add it your bash `PATH`:

	export PATH="$PATH:/path/to/gick"

In any git repository you can try:

	# Check the status
	> git status --short --branch
	## someBranch
	 M modifiedFile
	 D deletedFile
	M  stagedFile

	# Stage a file with any part of the name
	> gadd mod
	added 'modifiedFile'
	> gadd ted
	removed 'deletedFile'

	# Reset a file with any part of the name
	> geset aged
	reset 'stagedFile'
	> geset fied
	reset 'modifiedFile'

	# Print any file name that has a git status with part of the name
	> gick let
	deletedFile

	# And if you need it with status
	> gick -x del
	D  deletedFile

	# Check the upstream branch, if there is one
	> ginfo upstream
	No tracking branch

	# If there is a single remote, push to a same named branch
	> gush
	> git status --branch
	## someBranch...origin/someBranch



What is this?
-------------

`gick` is a simple program that prints files with a git status by providing just any part of the filename. Working with git means working with only the subset of files currently modified, narrowing the files you are interested in.

With this kind of fuzzy searching the comands to handle your files in git become extreme sort and very easy to think.

Instead of

	git add someFolder/src/package/someModifiedFile

Just use any part of the filename that is ambiguous enough

	gadd mod



Unit tests
----------

Unit tests use the [Bash Automated Testing System](https://github.com/sstephenson/bats).

All tests can be run by navigating to the repository root and passing to `bats` the whole `tests` repository:

	cd /path/to/gick
	bats tests

Individual tests also need to run from the repository root, since all the tests use the local repository version of the gick commands:

	cd /path/to/gick
	bats tests/glist.bats



