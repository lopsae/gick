tests
=====

Unit tests for *gick* use the [Bats](https://github.com/sstephenson/bats) project.

Tests are intended to be run from the root of the repostory, both when running single tests or the whole suite:


	# Single file
	cd /path/to/gick
	bats tests/gick.bats

	# Test suite
	cd /path/to/gick
	bats tests
