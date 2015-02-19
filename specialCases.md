Special Cases
=============

Remindner about special cases to test around
* Files with spaces in the name, files within subdirectories with spaces in the name
* Running commands from inside a subdirectory
* Untracked files inside subdirectories also untracked
* File replaced, that is: new file with same/similar content and original file deleted, both added to stage become the R status
* File with RM status. Same as above, but recovering and modifying the original, also this case makes a single file to have two status: ?? and RM
* Files with MM status, changed staged and further changes done