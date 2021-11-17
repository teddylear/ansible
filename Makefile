default: build run

build:
	docker build . -t ansbile

test:
	docker run ansbile
