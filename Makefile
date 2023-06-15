all: init link

init:
	bash ./bin/init.sh

link:
	bash ./bin/link.sh

tmux:
	bash ./bin/tmux.sh

zsh:
	bash ./bin/zsh.sh

other: tmux zsh
