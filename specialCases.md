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

AM = does not exist in HEAD, added to index, modified

?? -> wrong because a file cannot exist unknowing in stage

_? -? new in workspace, not known in stage

valid status: MAD_?

Index can have:
_ -> same as HEAD (no reset)
M -> exists in head, changed in stage (can reset, stage equaled to HEAD)
A -> Not exists in HEAD, exists in stage (can reset, removed from STAGE)
D -> Exists in Head, Not exists in head (can reset, stage equaled to HEAD)

Workspace can have:
_ -> same as index (no add)
M -> exists in stage, changed in workspace (can add, updates stage)
? -> not exists in stage, new in worspace (can add, addes to stage)
D -> exists in index, missing in workspace (can add, removes from stage)


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