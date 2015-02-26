Language Reminder
=================

git status for each file
in stage
in the workspace

commands or options like `-s` or `git status` are quoted likeso

stdin is standard input
stder is standard error

in code always use fileName. More in line with other cases like fileData, fileContents fileStatus, etc.

in helpdocs always use filename

in helpdocs, the "script" is always refered as "the script", not as "the program". E.g, "The script will exit with zero."
TODO script too specific, could be considered that program is more general and includes "scripts", and also this stuff may become a program (and right now it is a program) and then it stops being a script... change to program?

TODO should use filepath or filename? sounds weird in `gick` helpdoc
seems like filename would be more familiar...


Name sentence
-------------

Should read as an imperative to the program, starts with lowercase
* ls - list directory contents
* git-status - Show the working tree status
TODO this needs updating in all the scripts

Synopsis sentence
-----------------

Should read with an implicit [the script], and start with uppercase
* [the script] Selects a file for staging...

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


Options order
-------------

order of options in SYNOPSIS

-h <- always the first
-specific <- command specific options
-cx <- cut/verbose group
-swa <- stage/worspace/all group


-D <- debug/dev/dryrun, always the last


Options descriptions
--------------------

-h Prints this help output and quits the script.
TODO pending change, previous was "Prints this help output"

-p plain path, instead of searching with pick/gick
	original from gadd - Uses the parameters given as paths, instead of performing a search with `gick`.
	from giff - Prints only the filenames, status are ommited.


-s consider only stage files
	original from glist - Prints only files with any status in stage.
-w consider only workspace files
	original from glist - Prints only files with any status in the workspace.

-c cut off status
	original from glist - Prints only filenames, status are ommited.
-x show status
	original from gick - Prints the status of the file along the filename. The format remains the same used by `git status`.

-a work with all matches, instead of just the first
	original from pick - Displays all lines that match the search.
	from gadd - Stages all files that match the search, instead of only the first one.


-D dryrun/debug
	original from pick - Prints to standard error the regular expression used to search for matches.


Error outputs
-------------

Invalid options
echo "Invalid option: -$OPTARG" >&2

No parameters
echo 'No parameters given' >&2

No files found
echo 'No files found' >&2

No op
echo 'No operation done' >&2
