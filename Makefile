ifndef ANSIBLE_OPTS
ANSIBLE_OPTS=
endif

build:
	ansible-playbook $(ANSIBLE_OPTS) basebox.yml --extra-vars="state=present"

destroy:
	ansible-playbook $(ANSIBLE_OPTS) basebox.yml --extra-vars="state=absent"

# Make png from LibreOffice odp files
images: $(patsubst %.odp, %.png,$(shell find . -name \*.odp)) 
%.png: %.odp
	unoconv -f png -o $@ $^

setup:
	ansible  $(ANSIBLE_OPTS) -m setup localhost
