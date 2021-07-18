#!/bin/bash
# This script create symlinks from the home directory to any desired dotfile location
# https://betterprogramming.pub/managing-your-dotfiles-with-git-4dee603a19a2

# dotfiles directory
dir=~/swaydotfiles

# old dotfiles backup directory
olddir=~/swaydotfiles/dotfiles_old

# list of files/folder to symline in homedir
files=".bash_profile .bashrc .profile .zshrc .zshrc.pre-oh-my-zsh"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any exsisting dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to dotfiles directory
echo -n "changing to $dir directory"
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
	echo "Moving any existing dotfiles form ~ to $olddir"
	mv ~/$file $olddir
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/$file
done

