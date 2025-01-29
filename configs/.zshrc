# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "spaceship" )


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"


# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"


# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto        # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time


# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 2


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"


# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"


# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"


# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"


# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"


# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


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
  # Programs
  git docker python pip zoxide tmux rust

  # Decoding/Encoding
  urltools

  # Make aliasing easier
  aliases alias-finder common-aliases

  # Utils
  colored-man-pages command-not-found man

  zsh-autosuggestions zsh-vi-mode
)

fpath+="${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src"
source $ZSH/oh-my-zsh.sh

# AutoSuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#00bb9d,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=25

# Show aliases in terminal when used
ZSH_ALIAS_FINDER_AUTOMATIC=true

# User config
zstyle ':completion:*' menu yes select
zstyle ':autocomplete:*' min-delay .15
zstyle ':autocomplete:*' min-input 2
zstyle ':autocomplete:*' list-lines 4
zstyle ':autocomplete:history-search:*' list-lines 8
zstyle ':autocomplete:history-incremental-search-*:*' list-lines 16
zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':autocomplete:*' insert-unambiguous yes


# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory


# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ==============
# Aliases
# ==============
alias update='sudo apt update -y; sudo apt upgrade -y; sudo apt autoremove; sudo apt autoclean; sudo updatedb; rustup update'

# Miscellaneous
alias calc='mate-calculator -s ' \
      listen='pwncat -k -l' \
      exa='exa -hG --icons' \
      cat='bat' \
      extract_vsc='sudo rm -rf /usr/share/codium && sudo mkdir /usr/share/codium && sudo tar zxf ~/Downloads/VSCodium-* --directory=/usr/share/codium'

# Command line head / tail shortcuts
alias -g H='| head' \
      T='| tail' \
      G='| grep' \
      L="| less" \
      M="| most" \
      LL="2>&1 | less" \
      CA="2>&1 | cat -A" \
      NE="2> /dev/null" \
      NUL="> /dev/null 2>&1"

# OVPN configs
alias htb='sudo openvpn /root/HackTheBox/lab.ovpn' \
      comp='sudo openvpn /root/HackTheBox/competitive.ovpn' \
      thm='sudo openvpn /root/TryHackMe/main.ovpn' \
      sp='sudo openvpn /root/HackTheBox/startingPoint.ovpn' \
      ra='sudo openvpn /root/HackTheBox/RA.ovpn' \
      academy='sudo openvpn /root/HackTheBox/academy.ovpn'

# Listing
alias ls='exa' \
      la='l -aG'

# Exec
alias ghidra='/opt/ghidra*/ghidraRun' \
      stegsolve='/opt/stegsolve.jar' \
      cyberchef='firefox /opt/CyberChef/CyberChef*.html' \
      rustscan='docker run -it --rm rustscan/rustscan' \
      ciphey='docker run -it --rm --name ciphey remnux/ciphey' \
      stegseek='docker run --rm -it -v "$(pwd):/steg" --name stegseek rickdejager/stegseek' \
      afl='docker run -ti -v $(pwd):/src aflplusplus/aflplusplus' \
      sonicvisualizer='/opt/SonicVisualiser*.AppImage' \
      neo4j='docker run -d -p7474:7474 -p7687:7687 -e NEO4J_AUTH=neo4j/s3cr3t neo4j' \
      revshell='docker run --rm -d -p 1337:80 reverse_shell_generator' \
      nikto='/opt/nikto/program/nikto.pl' \
      rsactftool='python3 /opt/RsaCtfTool/RsaCtfTool.py' \
      sqlmap='python3 /opt/sqlmap/sqlmap.py'

function hex-encode()
{
  echo "$@" | xxd -p
}

function hex-decode()
{
  echo "$@" | xxd -p -r
}

function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

function check()
{
  target=$1
  good_hash=$2

  #if [[ -n $target ]] || [[ -n $good_hash ]]; then
  #  echo "usage: check <file> <hash>"
  #  return
  #fi

  zip_pwd="hackthebox"
  file_hash=$(sha256sum $target)

  if [[ $file_hash = $good_hash* ]]; then
    echo "[+] SHA256 matching!"
    echo "[+] Unzipping"
    echo ""
    unzip -P $zip_pwd $target
  else
    echo "[-] SHA256 is not matching!"
    echo "Expected: $good_hash"
    echo "Found: $file_hash"
  fi
}

export JAVA_OPTIONS="-Dsun.java2d.xrender=false"

# Add cargo to $PATH
PATH=$PATH:~/.cargo/bin

# Add foundry to $PATH
PATH=$PATH:~/.foundry/bin

# Add pwntools to $PATH
PATH=$PATH:~/.local/bin

# Add node to $PATH
PATH=$PATH:/opt/node-v*-linux-x64/bin

# Add go bins to $PATH
PATH=$PATH:~/go/bin

# Add snap bins to $PATH
PATH=$PATH:/snap/bin/

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source <(dalfox completion zsh 2>/dev/null)

autoload -U compinit
compinit -i

[[ -z $WAYLAND_DISPLAY ]] && startplasma-wayland
