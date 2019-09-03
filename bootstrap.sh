#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude ".aliases" \
		--exclude ".bash_prompt" \
		--exclude ".editorconfig" \
		--exclude ".exports" \
		--exclude ".functions" \
		--exclude ".gdbinit" \
		--exclude ".gitattributes" \
		--exclude ".gitconfig" \
		--exclude ".gvimrc" \
		--exclude ".hgignore" \
		--exclude ".hushlogin" \
		--exclude ".gdbinit" \
		--exclude ".macos" \
		--exclude ".screenrc" \
		--exclude ".wgetrc" \
		-avh --no-perms . ~;
		
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
