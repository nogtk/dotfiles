#!/bin/bash
# 配置したい設定ファイル
dotfiles=(.zshrc .vimrc .gemrc .ideavimrc .pryrc .tigrc .gitconfig)

# ホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
