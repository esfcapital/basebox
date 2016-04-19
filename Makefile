PYTHON_USER_BASE=$(shell python -m site --user-base)

ifndef ANSIBLE_OPTS
ANSIBLE_OPTS=
endif

build:
	$(PYTHON_USER_BASE)/bin/ansible-playbook $(ANSIBLE_OPTS) basebox.yml 

# Make png from LibreOffice odp files
images: $(patsubst %.odp, %.png,$(shell find . -name \*.odp)) 
%.png: %.odp
	unoconv -f png -o $@ $^

setup:
	$(PYTHON_USER_BASE)/bin/ansible  $(ANSIBLE_OPTS) -m setup localhost
