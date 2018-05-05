.DEFAULT_GOAL := build

merge:
	@git merge --no-ff purcell/master

fetch:
	@git fetch --all

backup:
	@cp custom.el custom.el.`date +%Y%m%d`

build: fetch

