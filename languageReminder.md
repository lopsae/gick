Language Reminder
=================

git status for each file
in stage
in the workspace

commands or options like `-s` or `git status` are quoted likeso

stdin is standard input

in code always use fileName. More in line with other cases like fileData, fileContents fileStatus, etc.

in helpdocs always use filename

in helpdocs, the "script" is always refered as "the script", not as "the program". E.g, "The script will exit with zero."


Synopsis sentence
-----------------

Should read with an implicit [the script]
* [the script] selects a file for staging...

Same applies for the beggining of DESCRIPTION
* [the script] Prints, from the content read from the standard input...

Canditates:
* selects a file with gick to stage
* runs git difftool using pick to select the file

* selects a file with gick to ...?
* runs ... using gick to select the file?

* selects a file using `gick` and stages it
* selects a file using `gick` and opens the diff tool to compare it

current favorites:
* stages a file selected with `gick`
* runs `git difftool` with a file selected with `gick`


Helpdoc
-------

sections are:
* NAME
* SYNOPSIS
* DESCRIPTION
* OPTIONS
* EXIT STATUS

thing about adding EXAMPLES after description or after options. For now examples are fine within description

order of options in SYNOPSIS
-h <- always the first
-specific <- command specific options
-cx <- cut/verbose group
-swa <- stage/worspace/all group


-D <- debug/dev/dryrun, always the last


Options
-------

-a show all matches when picking/gicking
	original from pick, later gick

-p plain path, do not pick
	original from giff
	original will be gadd

-s consider only stage files
-w consider only workspace files
	original from pick
	later gadd and all gick based commands

-c cut off status
	original from glist
-x show status
	original from gick

-D dryrun/debug
	original from pick


Error outputs
-------------

Invalid options
echo "Invalid option: -$OPTARG" >&2

No parameters
echo 'No parameters given' >&2

No files found
echo 'No files found' >&2