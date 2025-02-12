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

## Git Config
```shell
git config --global user.email "evan@wool.homes"
git config --global user.name "esize"
gh auth login && gh auth setup-git
```

## Windows Stuff
### oh-my-posh
```powershell
nvim $PROFILE
```
Edit the PowerShell configuration file and add the following line:
```powershell
(@(& 'C:/Users/evan/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\evan\dotfiles\.config\omp\omp.toml' --print) -join "`n") | Invoke-Expression
```

Create a symlink between the neovim config in the dotfiles repo and the Windows neovim directory.
```powershell
New-Item -Path ~\AppData\Local\nvim -ItemType SymbolicLink -Value C:\Users\evan\dotfiles\.config\nvim\
```
