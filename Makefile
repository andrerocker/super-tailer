build:
	gem build super-tailer.gemspec

push: build
	gem push $(shell ls *.gem | tail -1)
