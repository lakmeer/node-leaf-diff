default:
	lsc -cpb src/leaf-diff.ls > index.js

test:
	lsc test/test

.PHONY: test
