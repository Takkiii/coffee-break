#!/bin/zsh

echo "Hello.$(whoami)"

# Install Prezto
echo "=> git clone --recursive https://github.com/sorin-ionescu/prezto.git '${ZDOTDIR:-$HOME}/.zprezto'"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "=> mv ~/.zshrc ~/.zshrc_old"
mv ~/.zshrc ~/.zshrc_old

echo "=> setopt EXTENDED_GLOB"
setopt EXTENDED_GLOB

echo '=> ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"'
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "cat ~/.zshrc_old >> ~/.zshrc"
cat ~/.zshrc_old >> ~/.zshrc

echo "rm -rf ~/.zshrc_old"
rm -rf ~/.zshrc_old

echo '=> exec $SHELL -l'
exec $SHELL -l