# Decided to move away from oh-my-zsh
# This seems a lot more fun tbh
# makes the prompt look :pogchamp:
PS1="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%m %F{blue}%~%F{magenta}]%F{white}%(!.#.$) "
# see http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html for ways to customize
# I have been experimenting with the starship prompt so this might not exist soon

# Changes size and location of HISTFILE
HISTFILE=$XDG_CONFIG_HOME/zsh/HISTFILE
HISTSIZE=1000
SAVEHIST=1000

# tab complete config
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' menu select
zstyle :compinstall filename '$XDG_CONFIG_HOME/zsh/.zshrc'
zmodload zsh/complist
autoload -Uz compinit
compinit


# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# it make the ls funky !!!
alias ls="ls --color=auto"

# show hidden files in fzf instead of not doing that
export FZF_DEFAULT_COMMAND='find .'


# give tty gruvbox colour scheme
# you should be able to change this to anything you want
# its just that anything other than gruvbox is hot garbage
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi



# aliases !!!
alias rn="ranger"
alias pac="sudo pacman"
alias szrc="source $XDG_CONFIG_HOME/zsh/.zshrc"
alias cfz="nvim $XDG_CONFIG_HOME/zsh/.zshrc"
alias setbright="xrandr --output eDP1 --brightness"
alias v="nvim"
alias p="sudo pacman"
alias batpercent="echo $(cat /sys/class/power_supply/BAT0/capacity)%"
alias suckpatch="patch -p1 < ../patches/"
# installed by fzf for neovim
# idk might be different for vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship prompt
# https://www.starship.rs
# eval "$(starship init zsh)"


# highlights syntax
# think this has to be the last plugin sourced
# whatever just install zsh-syntax-highlighting-git from the AUR for the epic to happen.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
