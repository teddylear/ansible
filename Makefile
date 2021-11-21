default: build run

install:
	ANSIBLE_NOCOWS=1 ansible-playbook local.yml --ask-become-pass

build:
	docker build . -t ansbile

test:
	docker run ansbile
