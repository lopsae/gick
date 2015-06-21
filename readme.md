gools
=====


Quick setup
-----------

In your shell session run the following:

	export GOOLS_DIFFTOOL='vimdiff'
	export PATH="$PATH:/path/to/gools"

In any git repository you may try:

	# See the status
	> gt
	## someBranch
	 M some/folder/file
	 M some/folder/otherFile

	# Print the tracking branch, but none yet
	> gracking
	No tracking branch

	# Add some files, you only need one or more substrings of the path printed in git status
	> gad file
	add 'some/folder/file'
	> gad oth File
	add 'some/folder/otherFile'

	# Reset a file, also just with any piece of the path
	> geset other
	reset 'some/folder/otherFile'

	# Commit
	> gomit With this commit message.
	[someBranch abcd123] With this commit message.
	1 file changed, 2 insertions(+)

	# Create a tracking branch and push
	> gush
	...
	to origin
	 * [new branch] someBranch -> someBranch
	Branch someBranch set up to track remote branch someBranch from origin.

	# Now we are tracking something
	> gracking
	origin/someBranch



What is this?
-------------

Simple scripts and tools for git.

To use the executable files found here either add the project location into your PATH enviroment variable, or use directly the scripts wherever they are.

Some of the scripts depend on the enviroment variable GOOLS_DIFFTOOL
which is used as the --tool option for "git mergetool" and "git difftool".



Unit tests
----------

Unit tests use the [Bash Automated Testing System](https://github.com/sstephenson/bats).

All tests can be run by navigating to the repository root and passing to `bats` the whole `tests` repository:

	cd /path/to/gick
	bats tests

Individual tests also need to run from the repository root, since all the tests use the local repository version of the gick commands:

	cd /path/to/gick
	bats tests/glist.bats



