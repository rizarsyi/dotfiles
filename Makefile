install: install-ack install-bash install-fonts \
         install-git install-postgres install-python \
         install-ruby install-tmux install-vim

install-ack:
	rm -rf ~/.ackrc
	ln -s `pwd`/ack/ackrc ~/.ackrc

install-bash:
	rm -rf ~/.bash.d
	rm -rf ~/.bash_logout
	rm -rf ~/.bash_profile
	rm -rf ~/.bashrc
	ln -s `pwd`/bash/bash.d ~/.bash.d
	ln -s `pwd`/bash/bash_logout ~/.bash_logout
	ln -s `pwd`/bash/bash_profile ~/.bash_profile
	ln -s `pwd`/bash/bashrc ~/.bashrc

install-fonts:
	rm -rf ~/.fonts
	ln -s `pwd`/fonts/fonts ~/.fonts
	sudo rm -rf /etc/fonts/conf.d/10-powerline-symbols.conf
	sudo ln -s ~/.fonts/10-powerline-symbols.conf /etc/fonts/conf.d/10-powerline-symbols.conf
	fc-cache -vf ~/.fonts

install-git:
	rm -rf ~/.gitconfig
	ln -s `pwd`/git/gitconfig ~/.gitconfig

install-postgres:
	rm -rf ~/.psqlrc
	ln -s `pwd`/postgres/psqlrc ~/.psqlrc

install-python:
	rm -rf ~/.ipython
	rm -rf ~/.pdbrc
	rm -rf ~/.pypirc
	ln -s `pwd`/python/ipython ~/.ipython
	ln -s `pwd`/python/pdbrc ~/.pdbrc

install-ruby:
	rm -rf ~/.gemrc
	rm -rf ~/.irbrc
	ln -s `pwd`/ruby/gemrc ~/.gemrc
	ln -s `pwd`/ruby/irbrc ~/.irbrc

install-tmux:
	rm -rf ~/.tmux.conf
	ln -s `pwd`/tmux/tmux.conf ~/.tmux.conf

install-vim:
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	git submodule update
	ln -s `pwd`/vim/vim ~/.vim
	ln -s `pwd`/vim/vimrc ~/.vimrc
