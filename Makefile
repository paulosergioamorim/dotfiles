FOLDERS := */

all: $(FOLDERS)
	stow -R $^
