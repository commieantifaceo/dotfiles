# Decided to move away from oh-my-zsh
# This seems a lot more fun tbh
# Defines my Prompt
PROMPT="%F{red}[%F{yellow}%n%F{green}@%F{cyan}%m %F{blue}%~%F{magenta}]%F{white}%(!.#.$) "
# the %F{COLOUR} just makes the thing following it COLOUR
# %n displays username
# @ is just "@"
# %m displays hostname
# %~ displays working directory shortended (eg. ~/Music not /home/user/Music)
# %(!.#.$) is an if else statement. ! checks if the user is root
# if yes, display a #. if no, display a $
# The %# does the exact same thing
# but i dont use it because it replaces the $ with a % and thats just unattractive
# anything else is just regular old text

# Changes size and location of HISTFILE
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000

# tab complete config
# tbh i have no idea how to read this
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/human/.zshrc'
# the line below is for the stack exchange stolen shit
zmodload zsh/complist
autoload -Uz compinit
compinit


# took this shit off stack exchange
# https://unix.stackexchange.com/questions/313093/can-i-navigate-zshs-tab-completion-menu-with-vi-like-hjkl-keys#323282
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Use lf to switch directories and bind it to ctrl-o
# took this off luke smith's zshrc
# been tryna make it run with ranger instead
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# it make the ls funky !!!
alias ls="ls --color=auto"

# show dotfiles instead of not doing that
export FZF_DEFAULT_COMMAND='find .'


# Customize tty colours
# Got this from an askubuntu post
# https://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors
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
alias szrc="source ~/.config/zsh/.zshrc"
alias cfz="nvim ~/.config/zsh/.zshrc"
alias setbright="xrandr --output eDP1 --brightness"
alias v="nvim"
alias batpercent="cat /sys/class/power_supply/BAT0/capacity"

# installed by fzf for neovim
# idk might be different for vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# highlights syntax
# Must be last thing in .zshrc
# idk why maybe something else overrides it?
# whatever just install zsh-syntax-highlighting-git from the AUR for the epic to happen.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
