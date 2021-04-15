# Windows Terminal + WSL2 Ubuntu 20.04 LTS + Oh-my-Zsh + Powerlevel10k + plugins

<img src="/assets/terminal-windows.png">

Repository to not forget all...and share with community.

## Getting Started

### Prerequisites

Windows WSL2: --> https://docs.microsoft.com/es-es/windows/wsl/install-win10

### Installing

To get this configuration in your local environment you must follow this guide:

#### Install ZSH

```bash
sudo apt-get install zsh
```

#### Install Oh My ZSH

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Git clone Powerlevel10K theme and Configure it as you like.

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Restart Zsh and write: (If the configuration wizard doesn't start automatically.)
p10k configure
```

### Install fonts

Clone this repository and go to `fonts` folder and install.

Later open Ubuntu 20.04 LTS, go to properties and select `MESLO LGS NF` and size that you want.

<img src="/assets/fonts-config.png">

### Install Screenfetch

```bash
https://github.com/KittyKatt/screenFetch/wiki/Installation

# (Normally I use my /usr/local/bin/ to have all binary)
```

### Install plugins

```bash

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

Now, edit your ~/.zshrc file to activate it.

# Install Fuzzy

```bash
https://github.com/junegunn/fzf

# (Normally I use my /usr/local/bin/ to have all binary)
```

# Install Forgit

```bash

git clone https://github.com/wfxr/forgit ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit

# Source via .zshrc:

[ -f ~/.oh-my-zsh/custom/plugins/forgit/forgit.plugin.zsh ] && source ~/.oh-my-zsh/custom/plugins/forgit/forgit.plugin.zsh

```
Now, edit your ~/.zshrc file to activate it again.
# Install Git-Delta

```bash
https://github.com/dandavison/delta

# Modify your global config
git config --global -e
...
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only	
[delta]
    features = side-by-side line-numbers decorations
    syntax-theme = Monokai Extended	
    line-numbers = true
    plus-color = "#012800"
    minus-color = "#340001"
    side-by-side = false
    whitespace-error-style = 22 reverse
[delta "decorations"]
    commit-decoration-style = bold yellow box ul
    file-style = bold yellow ul
    file-decoration-style = none
...

```
### Install Ruby to enable colors

```bash

https://github.com/athityakumar/colorls

sudo apt-get install ruby-full
# restart the shell and run
sudo gem install colorls
# and add to ~/.zshrc near the bottom of the file
source $(dirname $(gem which colorls))/tab_complete.sh
# to have it replace your standard ls command, you can append to ~/.zshrc
alias ls=colorls

```

#### Export and Import  ~/.zsh_history

```bash
cp ~/.zsh_history  ~/.zsh_history.bak   # Easy, only copy from OLD zsh config and paste in new one.
```

### Visual Studio

```bash
code .
```

Finally restart WSL and you should see a complete amazing terminal ;-)
If you have any doubts you can contact with me and I will try to help you!

Also I upload all my config to repository you can see:

* .p10k.zsh
* .zshrc
* .gitconfig

## Licence

MIT

## References

* https://askubuntu.com/questions/131823/how-to-make-zsh-the-default-shell

* https://github.com/romkatv/powerlevel10k

* https://www.ivaylopavlov.com/setting-up-windows-terminal-wsl-and-oh-my-zsh/#install_powerlevel10k

* https://www.naschenweng.info/2021/01/05/improved-terminal-experience-with-oh-my-zsh-iterm2-powerlevel10k/

* https://nickymeuleman.netlify.app/blog/linux-on-windows-wsl2-zsh-docker#zsh

* https://github.com/romkatv/powerlevel10k/issues/310

* Google...

David Álvarez Quiroga
