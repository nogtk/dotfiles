#!/bin/bash
# 配置したい設定ファイル
files=(.zshrc .vimrc .gemrc .ideavimrc .pryrc .tigrc .gitconfig Brewfile .vscode/.vimrc)

# ホームディレクトリ直下に作成する
for file in "${files[@]}"; do
	ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/starship.toml $HOME/.config/
