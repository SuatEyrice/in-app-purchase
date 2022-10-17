init:
	@echo 'create git pre-commit hook'
	ln -s ../../precommit.sh .git/hooks/pre-commit
	@echo 'adjust pre-commit hook file permission'
	chmod +x .git/hooks/pre-commit
	@echo 'install dependencies'
	npm install
	@echo 'done'

.PHONY: lint
lint:
	./lint

.PHONY: test
test:
	./node_modules/mocha/bin/mocha test/apple.js -R spec -b --timeout=5000 --path=false
	./node_modules/mocha/bin/mocha test/google.js -R spec -b --path=false --pk=false
.PHONY: aptest
aptest:
	./node_modules/mocha/bin/mocha test/apple.js -R spec -b --timeout=5000 --path=false

.PHONY: gotest
gotest:
	./node_modules/mocha/bin/mocha test/google.js -R spec -b --path=false --pk=false



.PHONY: test-apple
test-apple:
	./node_modules/mocha/bin/mocha test/apple.js -R spec -b --timeout=5000 --path=$(path)

.PHONY: test-google
test-google:
	./node_modules/mocha/bin/mocha test/google.js -R spec -b --path=$(path) --pk=$(pk)

