#!
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]
then

ping -c 1 -W 1 github.com 2>&1>/dev/null
if [[ $? -ne 0 ]]
then
 echo "no connection to github.com"
 exit 1
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if [[ $? -ne 0 ]]
then
 echo "no connection to github.com"
 exit 1
fi

fi

cp vundle_config.vim ~/.vim/vundle_config.vim
vundle_config_src="source ~/.vim/vundle_config.vim"
grep -q "$vundle_config_src" .vimrc
if [[ $? -eq 0 ]]
then
  echo "vundle_config already sourced"
else
  echo "sourcing vundle_config"
  echo $vundle_config_src >> .vimrc
fi
cp .vimrc ~/.vimrc
vim +PluginInstall +qall

cp .bashrc ~/.bashrc

sudo apt-get install clang cmake python-dev python3-dev build-essential exuberant-ctags
( cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer )

git config --global user.email matthewaveryusa@gmail.com
git config --global user.name "Matthew Avery"
