BRANCH=master
publish:
	echo 'aaaa'
	echo "$(shell git branch | grep '*')" = "* ${BRANCH}"
	test "$(shell git branch | grep '*')" = "* ${BRANCH}"
	echo 'ab'
