TOP = hello

build log:
	@mkdir -p $@
	@echo "*" > $@/.gitignore

build/$(TOP): build $(TOP).c
	@gcc -o build/$(TOP) $(TOP).c

.PHONY: run
run: build/$(TOP)
	@./build/$(TOP)

.PHONY: clean
clean:
	@rm -rf build log

.PHONY: all
all:
	@$(MAKE) -s clean
	@$(foreach bhuu,$(shell find . -name "*.c" | sed "s|.*/||" | sed "s/\.c//"),$(MAKE) -s run TOP=$(bhuu);)