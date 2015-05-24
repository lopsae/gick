Special Cases
=============

Remindner about special cases to test around
* Files with spaces in the name, files within subdirectories with spaces in the name
* Running commands from inside a subdirectory
* Untracked files inside subdirectories also untracked
* File replaced, that is: new file with same/similar content and original file deleted, both added to stage become the R status
* File with RM status. Same as above, but recovering and modifying the original, also this case makes a single file to have two status: ?? and RM
* Files with MM status, changed staged and further changes done


Correct git status
==================

git status:
* first letter: diff HEAD <-> index
* second letter: diff index <-> workspace

Status and file contents:

	Stage status
	|Workspace status
	||    Head file
	||    | Stage file
	||    | | Workspace file
	||    | | |
	SW -> H S W : Notes

example:

	AM -> _ A B : does not exist in HEAD, exists in index, different content in workspace

Some git status are functionaly wrong:

	?? -> _ _ A : wrong because a ? in S-position should denote a file missing from HEAD
	this should be:
	_? -> _ _ A : HEAD and index are the same so '_' status,
	              new in workspace so '?' status

Valid status:
* M -> A B : Modified, valid in stage and workspace
* D -> A _ : Deleted, valid in stage and workspace
* _ -> A A : No status, valid in stage and workspace

* A -> _ A : Added, valid only in Stage, equivalent of '?'
* ? -> _ A: Untracked, valid only in workspace, equivalent of 'A'

Index status and operations allowed (reset):

	_. -> A A . : same as HEAD (cannot reset)
	M. -> A B . : exists in head, modified in stage (can reset, HEAD -> stage)
	D. -> A _ . : exists in Head, missing in stage (can reset, HEAD -> stage)
	A. -> _ A . : missing in HEAD, exists in stage (can reset, stage removed)

Workspace status and operations allowed (add):

	._ -> . A A : same as index (cannot add)
	.M -> . A B : exists in stage, modified in workspace (can add, workspace -> stage)
	.D -> . A _ : exists in index, missing in workspace (can add, stage removed)
	.? -> . _ A : missing in stage, exists in worspace (can add, workspace -> stage)

So in a nutshell:
* reset always equates HEAD into stage
	H>S W
* add always equates workspace into stage
	H S<W

Reset always clears the stage status, workspace is never touched

	Mx -> _x
	Dx -> _x
	Ax -> _x

Add always clears workspace status

	xM -> M_
	xD -> D_
	x? -> A_


All possible status combinations
--------------------------------

_M -> A A B
_D -> A A _
_? -> _ _ A
__ -> A A A invalid: there is no status

MM -> A B C
MD -> A B _
M? -> A * C contradiction 1
M_ -> A B B

DM -> A * B contradiction 2
DD -> A * _ contradiction 3
D? -> A _ B
D_ -> A _ _

AM -> _ A B
AD -> _ A _
A? -> _ * A contradiction 4
A_ -> _ A A


Contradictions
--------------

M? -> A * C : 1 : * cannot be both B and _
      A B
        _ C

DM -> A * B : 2 : * cannot be both _ and B
      A _
        B C

DD -> A * _ : 3 : * cannot be both _ and B
      A _
        B _

A? -> _ * C : 4 : * cannot be both B and _
      _ B
        _ C


All valid status (ordered by operations)
----------------------------

_? -> _ _ A : workspace new
A_ -> _ A A : staged new
AM -> _ A B : staged new, workspace new changed
AD -> _ A _ : staged new, workspace deleted

_M -> A A B : workspace changed
M_ -> A B B : staged change
MM -> A B C : staged change, workspace changed
MD -> A B _ : staged change, workspace deleted

_D -> A A _ : workspace deleted
D_ -> A _ _ : staged delete
D? -> A _ B : staged delete, workspace readded


