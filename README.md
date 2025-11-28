Installation:
```
git clone --recursive git://github.com/gyr/dotvim.git ~/.vim
```


Installing plugins:
```
PLUGINS="http://github.com/dense-analysis/ale.git
  http://github.com/junegunn/fzf.git
  http://github.com/junegunn/fzf.vim.git
  http://github.com/brennovich/marques-de-itu.git
  http://github.com/andreasvc/vim-256noir.git
  http://github.com/tpope/vim-fugitive.git
  http://github.com/rhysd/vim-lsp-ale.git
  http://github.com/prabirshrestha/vim-lsp.git
  http://github.com/mhinz/vim-signify.git
  http://github.com/tpope/vim-unimpaired.git
  http://github.com/vimwiki/vimwiki.git"
mkdir -p ~/.vim/pack/vendor/start
for i in ${PLUGINS}
do
    git -C ~/.vim/pack/vendor/start clone $i
done
```


Upgrading all plugins:
```
for i in $(ls ~/.vim/pack/vendor/start)
do
    pushd ~/.vim/pack/vendor/start/$i
    git fetch --prune --all
    git pull
    popd
done
```

Adding a plugin:
```
git -C ~/.vim/pack/vendor/start clone <git_repos_url>
```

Removing a plugin :
```
rm -rf ~/.vim/pack/vendor/start/<plugin_name>
```
