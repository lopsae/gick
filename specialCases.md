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
first letter: diff HEAD <-> index
second letter: diff index <-> workspace

example:
AM = does not exist in HEAD, added to index, modified

?? -> wrong because a file cannot exist unknowing in stage
should be:
_? -> new in workspace, not known in stage, not known in head

valid status: MAD_?

Index can have (and operations allowed):
_ -> same as HEAD (cannot reset)
M -> exists in head, changed in stage (can reset, stage equaled to head)
D -> Exists in Head, Not exists in stage (can reset, stage equaled to head)
A -> Not exists in HEAD, exists in stage (can reset, removed from stage)

Workspace can have:
_ -> same as index (cannot add)
M -> exists in stage, changed in workspace (can add, updates stage)
D -> exists in index, missing in workspace (can add, removes from stage)
? -> not exists in stage, new in worspace (can add, adds to stage)

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

All possible status:
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


File in Head, Stage, Workspace:
H S W
X X X -> __
X X A -> _M
X A A -> M_
X A B -> MM
_ _ A ->  ? -> in git is ??
_ A A -> A_
_ A B -> AM
X X _ -> _D
X _ _ -> D_
X _ A -> D?