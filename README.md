# Windows Terminal + Fonts + WSL2 Ubuntu 22.04.2 LTS + Oh-my-Zsh(Plugins) + Powerlevel10k + Tmux (Dracula) + EXA + KIND (Kubernetes)

<img src="/assets/terminal-windows.png">

Repository to not forget all...and share with community.

## Getting Started

### Prerequisites

Windows WSL2: --> https://docs.microsoft.com/es-es/windows/wsl/install-win10

After enable Windows Subsystem, go to Microsoft Store and install Windows Terminal & Ubuntu

Ubuntu 22.04.2 LTS:

<img src="/assets/Microsoft_store_ubuntu_install.png">

Windows Terminal:

<img src="/assets/Microsoft_store_windows_terminal_install.png">

### Installing

To get this configuration in your local environment you must follow this guide:

#### Install Nerd Fonts

Go to fonts folder in this repo and double click to install in Windows:

- MesloLGS NF Regular.ttf
- MesloLGS NF Italic.ttf
- MesloLGS NF Bold.ttf
- MesloLGS NF Bold Italic.ttf

If you don't trust me and don't want to use the fonts in the folder, you can download the original files in --> https://www.nerdfonts.com/

Once installed, open Ubuntu 20.04.2 LTS configuration, go to properties:

- Select `MESLO LGS NF` 
- Size of letters that you want for me 10.

<img src="/assets/select_fonts_in_ubuntu.png">


#### Install ZSH

```bash
sudo apt-get install zsh
```

#### Install Oh My ZSH

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Install Powerlevel10K theme

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### Install ZSH plugins

Execute the command directly in your terminal.

#### zsh-autosuggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
#### zsh-completions
```bash
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```
#### zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

More sotfware third party:

#### Install Screenfetch

Download and put the binary in /usr/local/bin/

```bash
https://github.com/KittyKatt/screenFetch/wiki/Installation
```

#### Install FZF
```bash
sudo apt install fzf
```

#### Install Forgit (Dependency of FZF)
```bash
git clone https://github.com/wfxr/forgit ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/forgit
```

Now, edit your ~/.zshrc file to activate it.

```bash
plugins=(
        git
        zsh-autosuggestions
        zsh-syntax-highlighting
        zsh-completions
        kubectl
        aws
        forgit
)
```

You see that I have also aws and kubectl plugins:

--> (OPTIONAL) AWS-CLI Auto-Completion + FZF + OhMyZSH = https://medium.com/@herryhan2435/using-aws-cli-with-fzf-on-ohmyzsh-ec995ee3784f


#### Install EXA
```bash
sudo apt install exa
```

Now, edit your ~/.zshrc file to configure alias for ll and llt.
```bash
# EXA https://github.com/ogham/exa#installation
alias ll="exa -l -g --icons"
alias llt="exa -1 --icons --tree"
```

#### Change default color of your VIM

Create a .vimrc file with the following command: 
```bash
vim ~/.vimrc
```

This example uses the desert colorscheme:
Hold Shift and hit : then type wq to save and quit the file.
```bash
syntax on
colorscheme desert
```

https://mediatemple.net/community/products/dv/204644480/enabling-vi-syntax-colors-and-highlighting

#### Install tmux & theme Dracula using TPM

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Now create the file:

```bash
vim ~/.tmux.conf
```

And here my configuration, you can copy/paste and save:
```bash
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Dracula
set -g @plugin 'dracula/tmux'

# available plugins: battery, cpu-usage, git, gpu-usage, ram-usage, network, network-bandwidth, network-ping, attached-clients, network-vpn, weather, time
set -g @dracula-plugins "cpu-usage ram-usage weather"

# available colors: white, gray, dark_gray, light_purple, dark_purple, cyan, green, orange, red, pink, yellow
# set -g @dracula-[plugin-name]-colors "[background] [foreground]"
set -g @dracula-cpu-usage-colors "pink dark_gray"

#Enable powerline symbols
set -g @dracula-show-powerline true

#Enable window flags
set -g @dracula-show-flags true

# the default is 5, it can accept any number
set -g @dracula-refresh-rate 5

# Set your location manually
set -g @dracula-fixed-location "Móstoles"

# Enable Scroll
set -g mouse on

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

Reload Tmux with theme:

```bash
tmux source ~/.tmux.conf
```
https://draculatheme.com/tmux

#### Scroll Ubuntu + Windows Terminal

Replace the default number by 50000 (Number of lines that you will be able to see ... )

<img src="/assets/number_scroll_ubuntu.png">

#### Export and Import  ~/.zsh_history from other PC.

```bash
cp ~/.zsh_history  ~/.zsh_history.bak   # Easy, only copy from OLD zsh config and paste in new one.
```

#### Kubecolor

Download and put the binary in /usr/local/bin/

```bash
https://github.com/hidetatz/kubecolor
```

<img src="/assets/kubecolor_example.png">

#### Nerdctl

Download and put the binary in /usr/local/bin/

```bash
https://github.com/containerd/nerdctl
```


#### Visual Studio

```bash
code .
```

Finally restart WSL and Windows and you should see a complete amazing terminal ;-)
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

* https://www.hostinger.es/tutoriales/usar-tmux-cheat-sheet

* https://dev.to/nexxeln/my-developer-workflow-using-wsl-tmux-and-neovim-55f5

* Google...

David Álvarez Quiroga
