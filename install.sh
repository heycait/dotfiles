#!/bin/bash
set -eu

cp .bash_profile      $HOME/.bash_profile
cp .bashrc            $HOME/.bashrc
cp .gitconfig         $HOME/.gitconfig
cp .inputrc           $HOME/.inputrc
cp .irbrc             $HOME/.irbrc
cp .pryrc             $HOME/.pryrc
cp .rspec             $HOME/.rspec
cp .vimrc             $HOME/.vimrc

echo "Dotfiles successfulled copied"
