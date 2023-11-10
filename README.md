Installation:
```
    git clone --recursive git://github.com/gutoyr/dotvim.git ~/.vim

    or

    git clone git://github.com/gutoyr/dotvim.git ~/.vim
    #ln -s ~/.vim/vimrc ~/.vimrc
    #ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule init
    git submodule sync
    git submodule update
```


Upgrading a plugin bundle:
```
    cd ~/.vim/bundle/fugitive
    git pull origin master
```


Upgrading all bundled plugins:
```
    git submodule update --remote

    or

    git submodule foreach git pull origin {master,main}
```

Adding a plugin bundle:
```
    cd ~/.vim
    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git submodule init
```

[git submodule + pathogen reference][1]

Removing a plugin bundle:
```
    cd ~/.vim
    git submodule deinit -f bundle/fugitive
    rm -rf .git/modules/bundle/fugitive
    git rm -f bundle/fugitive
    git clean -dfx
```

    or

    To remove a submodule you need to:

    Delete the relevant section from the .gitmodules file.
    Stage the .gitmodules changes git add .gitmodules
    Delete the relevant section from .git/config.
    Run `git rm --cached path_to_submodule` (no trailing slash).
    Run `rm -rf .git/modules/path_to_submodule`
    Commit `git commit -m "Removed submodule <name>"`
    Delete the now untracked submodule files
    `rm -rf path_to_submodule`

[git submodule reference][2]

[1] http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
[2] https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial#Removal
[3] https://www.vogella.com/tutorials/GitSubmodules/article.html
