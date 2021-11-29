default: install

install:
	ANSIBLE_NOCOWS=1 ansible-playbook local.yml --ask-become-pass

neovim:
	ANSIBLE_NOCOWS=1 ansible-playbook local.yml --ask-become-pass --tags "neovim"

devTools:
	ANSIBLE_NOCOWS=1 ansible-playbook local.yml --ask-become-pass --tags "devTools"

test:
	docker build . -t ansbile
	docker run ansbile
