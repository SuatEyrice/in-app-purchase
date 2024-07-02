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
	npx mocha test/google.js -R spec -b --path=false --pk=false

.PHONY: gotest
gotest:
	npx mocha test/google.js -R spec -b --path=false --pk=false



.PHONY: test-google
test-google:
	npx mocha test/google.js -R spec -b --path=$(path) --pk=$(pk)

