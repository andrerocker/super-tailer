build:
	gem build super_tailer.gemspec

push: build
	gem push $(shell ls *.gem | tail -1)
