default: install

install:
	ANSIBLE_NOCOWS=1 ansible-playbook local.yml --ask-become-pass

neovim:
	ANSIBLE_NOCOWS=1 ansible-playbook local.yml --ask-become-pass --tags "neovim"

test:
	docker build . -t ansbile
	docker run ansbile
