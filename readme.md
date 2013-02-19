gools
=====


Quick setup
-----------

In your shell session run the following:

	export GOOLS_DIFFTOOL='vimdiff'
	source /path/to/gools/.galiases
	export PATH="$PATH:/path/to/gools"

In any git repository you have try
	# See the status
	> gt
	## someBranch
	 M some/folder/file
	 M some/folder/otherFile
	
	# Display the tracking branch
	> gracking
	No tracking branch
	
	# Add some files, you only need one or more pieces of the path
	> gad file
	add 'some/folder/file'
	> gad oth File
	add 'some/folder/otherFile'
	
	# Reset again a file, also just with any piece of the path
	> geset her
	reset 'some/folder/otherFile'
	
	# Commit
	> gomit With this commit message.
	[someBranch abcd123] With this commit message.
	1 file changed, 2 insertions(+)
	
	# Create a tracking branch and push
	> gush
	to origin
	 * [new branch]      someBranch -> someBranch
	Branch someBranch set up to track remote branch someBranch from origin.
	
	# Now we are tracking something
	> gracking
	origin/someBranch


What is this?
-------------

Simple scripts and tools for git.


To use the executable files found here either add the project location into your PATH enviroment variable, or use directly the scripts wherever they are.

Some scripts may use the aliases defined in the .galiases file. This must be sourced into your current shell session.

Some of the scripts depend on the enviroment variable GOOLS_DIFFTOOL
which is used as the --tool option for "git mergetool" and "git difftool".


