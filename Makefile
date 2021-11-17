default: build run

install:
	ansible-playbook local.yml --ask-become-pass

build:
	docker build . -t ansbile

test:
	docker run ansbile
