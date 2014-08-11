install: install-ack install-bash \
         install-fonts install-git install-mad \
         install-postgres install-python install-tmux install-vim

install-bash:
	rm -rf ~/.bash.d
	rm -rf ~/.bash_logout
	rm -rf ~/.bash_profile
	rm -rf ~/.bashrc
	ln -s `pwd`/bash/bash.d ~/.bash.d
	ln -s `pwd`/bash/bash_logout ~/.bash_logout
	ln -s `pwd`/bash/bash_profile ~/.bash_profile
	ln -s `pwd`/bash/bashrc ~/.bashrc

install-git:
	rm -rf ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-mad:
	rm -rf ~/.mad
	ln -s `pwd`/mad ~/.mad

install-postgres:
	rm -rf ~/.psqlrc
	ln -s `pwd`/postgres/psqlrc ~/.psqlrc

install-python:
	rm -rf ~/.ipython
	rm -rf ~/.pdbrc
	rm -rf ~/.pypirc
	ln -s `pwd`/python/ipython ~/.ipython
	ln -s `pwd`/python/pdbrc ~/.pdbrc

install-tmux:
	rm -rf ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf

install-vim:
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	git submodule update
	ln -s `pwd`/vim/vim ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
