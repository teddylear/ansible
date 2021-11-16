default: build run

build:
	docker build . -t ansbile

test:
	docker run -v $(shell pwd):/usr/local/bin -t ansbile
