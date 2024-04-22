Dotfiles repo as described in [this article](https://www.atlassian.com/git/tutorials/dotfiles).

## To Download on Fresh System:
```shell
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

```shell
echo ".dotfiles" >> .gitignore
```

```shell
git clone --bare https://github.com/esize/dotfiles.git $HOME/.dotfiles
```


```shell
config checkout
```

If ```config checkout``` returns an error, run the following:

```shell
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

```shell
config config --local status.showUntrackedFiles no
```
