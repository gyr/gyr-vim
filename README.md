Installation:

    cd ~
    git clone git://github.com/gutoyr/dotvim.git ~/.vim
    #ln -s ~/.vim/vimrc ~/.vimrc
    #ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule init
    git submodule update


Upgrading a plugin bundle:

    cd ~/.vim/bundle/fugitive
    git pull origin master


Upgrading all bundled plugins:

    git submodule foreach git pull origin master

Adding a plugin bundle:

    cd ~/.vim
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

Reference: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
