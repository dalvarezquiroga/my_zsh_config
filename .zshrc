# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dalvarez/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=5

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	kubectl
	aws
	forgit
	asdf
)

source $ZSH/oh-my-zsh.sh

# User configuration

## Screenfetch ##
screenfetch -A Linux

## ssh key ##
export SSH_KEY_PATH="~/.ssh/rsa_id"

## Alias kubecolor ##
alias k=kubecolor
complete -F __start_kubectl k

# kubectl enable
alias kubectl="kubectl"

# EXA https://github.com/ogham/exa#installation
alias ll="exa -l -g --icons"
alias llt="exa -1 --icons --tree"

# GIT
alias gs="git status"

# FILES
alias repos="cd /mnt/c/Users/dalvarez/Documents/git"

# Wheter
alias tiempo='curl -s wttr.in | head -7'

# Docker remove all images
alias docker-remove-images="docker rmi $(docker images -q)"

# EC2
alias ec2="aws ec2 describe-instances --filters Name=tag-key,Values=Name --query \"Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,IP:NetworkInterfaces[0].PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value}\" --output text | more"

# GET CRD
alias flux_crd='k get crd -A | grep flux'

# Get shortcat
alias shortcat='kubectl api-resources'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vi ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

####################
####### KREW #######
####################
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

####################
####### KIND #######
####################
function kind_create() {
  echo "-----------------> Create a cluster K8S <------------------"
  cat <<EOF | kind create cluster --config=-
  kind: Cluster
  apiVersion: kind.x-k8s.io/v1alpha4
  nodes:
  - role: control-plane
    kubeadmConfigPatches:
    - |
      kind: InitConfiguration
      nodeRegistration:
        kubeletExtraArgs:
          node-labels: "ingress-ready=true"
    extraPortMappings:
    - containerPort: 80
      hostPort: 80
      listenAddress: "127.0.0.1"
      protocol: TCP
    - containerPort: 443
      hostPort: 443
      listenAddress: "127.0.0.1"
      protocol: TCP
  - role: worker
  - role: worker
EOF

  # https://kind.sigs.k8s.io/docs/user/ingress/
  echo "---------------> Create Ingress configuration <-------------------"
  kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
  kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller  --timeout=90s
  #kubectl apply -f /home/alvardav/kind/davidtest.127.0.0.1.nip.io_example_pod_svc_ingress_nio.yaml
  #kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml
  #curl localhost/foo/hostname
  #curl localhost/bar/hostname
}

function kind_delete(){
  kind delete cluster
}
