default: install

install:
	ANSIBLE_NOCOWS=1 ansible-playbook $TAGS local.yml --ask-become-pass

build:
	docker build . -t ansbile

test:
	docker run ansbile
