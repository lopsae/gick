
# Functions for creating different repositories
# needs to be loaded after sharedVars



# Creates a repository with files in all possible status
# testrepo
# ├─ workspaceChanged    : _M, commited & changed
# ├─ stagedChange        : M_, commited & staged change
# ├─ stagedChangeChanged : MM, commited & staged change & changed
# ├─ stagedChangeDeleted : MD, commited & staged change & deleted
# │
# ├─ workspaceDeleted    : _D, commited & deleted
# ├─ stagedDelete        : D_, commited & staged delete
# ├─ stagedDeleteNew     : D?, commited & staged deleted & recreated file
# │
# ├─ workspaceNew        : _?, new file
# ├─ stagedNew           : A_, staged new
# ├─ stagedNewChanged    : AM, staged new & changed
# └─ stagedNewDeleted    : AD, staged new & deleted
setupRepoAllStatus() {
	rm -rf $testRepo

	mkdir $testRepo
	cd $testRepo

	git init

	# Files that need to be commited first
	echo 'workspace changed'         > workspaceChanged
	echo 'staged change'             > stagedChange
	echo 'staged change and changed' > stagedChangeChanged
	echo 'staged change and deleted' > stagedChangeDeleted

	echo 'workspace deleted'         > workspaceDeleted
	echo 'staged delete'             > stagedDelete
	echo 'staged delete and new'     > stagedDeleteNew

	git add --all
	git commit -m 'First commit'

	# Setting al possible status

	# _M
	echo 'change in workspace' >> workspaceChanged

	# M_
	echo 'change to stage' >> stagedChange
	git add stagedChange

	# MM
	echo 'change to stage' >> stagedChangeChanged
	git add stagedChangeChanged
	echo 'change in workspace' >> stagedChangeChanged

	# MD
	echo 'change to stage' >> stagedChangeDeleted
	git add stagedChangeDeleted
	rm stagedChangeDeleted

	# _D
	rm workspaceDeleted

	# D_
	rm stagedDelete
	git add -A stagedDelete

	# D?
	rm stagedDeleteNew
	git add -A stagedDeleteNew
	echo 'recreated in workspace' > stagedDeleteNew

	# _?
	echo 'new in workspace' > workspaceNew

	# A_
	echo 'new and staged' > stagedNew
	git add stagedNew

	# AM
	echo 'new in workspace' > stagedNewChanged
	git add stagedNewChanged
	echo 'change in workspace' >> stagedNewChanged

	# AD
	echo 'new in workspace' > stagedNewDeleted
	git add stagedNewDeleted
	rm stagedNewDeleted
}

