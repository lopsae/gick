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

	AM -> _ A B : does not exist in HEAD, exists in index, modified in workspace

Some git status are functionaly wrong:

	?? -> _ _ A : wrong because a file cannot exist unknowing in stage
	ti should be:
	_? -> _ _ A : HEAD and index are the same so '_' status,
	              new in workspace so '?' status

Valid status:
* M: Modified, valid in stage and workspace
* D: Deleted, valid in stage and workspace
* _: No status, valid in stage and workspace
* A: Added, valid only in Stage, equivalent of '?'
* ?: Untracked, valid only in workspace, equivalent of 'A'

Index status can be (and operations allowed):

	_• -> X X • : same as HEAD (cannot reset)
	M• -> X A • : exists in head, modified in stage (can reset, HEAD -> stage)
	D• -> X _ • : exists in Head, missing in stage (can reset, HEAD -> stage)
	A• -> _ X • : missing in HEAD, exists in stage (can reset, stage removed)

Workspace status can have (and operations allowed):

	•_ -> • X X : same as index (cannot add)
	•M -> • X A : exists in stage, modified in workspace (can add, workspace -> stage)
	•D -> • X _ : exists in index, missing in workspace (can add, stage removed)
	•? -> • _ X : missing in stage, exists in worspace (can add, workspace -> stage)

So in a nutshell:
* reset always equates HEAD into stage
* add always equates workspace into stage

Reset always clears the stage status, workspace is never touched

	MX -> _X
	DX -> _X
	AX -> _X

	M_ -> _M
	D_ -> _D
	A_ -> _?

Add always clears workspace status

	XM -> M_
	XD -> D_
	X? -> A_

All possible status combinations:
_M -> X X A
_D -> X X _
_? -> _ _ A
__ -> X X X but invalid: there is no status
MM -> X A B
MD -> X A _
M? -> invalid: ? can only exist without a stage, this is MD
M_ -> X A A
DM -> X _ A
DD -> invalid: if workspace is releted then it becomes D_
D? -> invalid: ? can only exists without a stage, this is D_
D_ -> X _ _
AM -> _ A B
AD -> _ A _
A? -> invalid: ? can only exist without a stage, this is: AD
A_ -> _ A A

