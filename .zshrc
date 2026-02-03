# Setting locale environment variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

cols=$(tput cols)

clear
#if [ "$cols" -lt 92 ]; then
    figlet "Welcome Mr." && figlet "De Beule"
    #fortune | cowsay|lolcat
#else
#    bash /opt/welcomMessage/print.sh
#    fortune | cowsay -f ghostbusters|lolcat
#fi
#if ! command -v lolcat &> /dev/null; then
#  neofetch
#else
#  neofetch | lolcat
#fi

#if command -v figlet &> /dev/null; then
#    figlet 'Welcome MR.' && figlet 'DE BEULE'
#else
#    echo "Welcome MR. DE BEULE"
#fi

yabai  --start-service
#neofetch
#clear
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#JAVA
#

#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"
#export JAVA_HOME=$(/usr/libexec/java_home -v 17)
#export PATH="$JAVA_HOME/bin:$PATH"
#JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
#JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home"
#JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home
#export JAVA_HOME
#export PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$JAVA_HOME/bin:$PATH"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/Users/chris/flutter/bin"
export PATH="$PATH:/Users/chris/Documents/projects/private/development/flutter/bin"
export LS_COLORS="$LS_COLORS:di=1;36:ln=4;93:ex=38;5;172:*.desktop=4;34:*.md=4;95:*.tar.gz=0;37:*.py=0;33:*.pdf=38;5;141:*.lua=0;94:*.sh=0;32;:*.txt=38;5;253:*.cfg=38;5;184:fi=0;37:"
export GROOVY_HOME="/opt/homebrew/opt/groovy/libexec"

ZSH_THEME="powerlevel10k/powerlevel10k"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

source $ZSH/oh-my-zsh.sh

function findDemoDir() {
    if [[ "$1" == '-h' || "$1" == '--help' ]]; then
        echo "Usage:"
        echo "go_to_dir <company name or dir name>" 
        return
    fi

    # Check for empty input
    if [[ -z "$1" ]]; then
        echo "Error: No directory name provided."
        echo "Usage: go_to_dir <company name or dir name>"  
        return  # Exit the function early if no argument is provided
    fi

    local dirs=()
    while IFS= read -r line; do
        dirs+=("$line")
    done < <(bash /Users/chris/Documents/projects/Exalate/Clients/findDemoDir_v2.sh "$1")

    local count=${#dirs[@]}
    
    echo "Directories found: $count"
    #printf '%s\n' "${dirs[@]}"
    
    if [ "$count" -eq 1 ]; then
        local dir="${dirs[@]}"
        echo "Attempting to change to directory: $dir"
        if [[ -d "$dir" ]]; then
            cd "$dir"
            echo "Changed to directory: $dir"
        else
            echo "Directory does not exist: $dir"
        fi
    elif [ "$count" -gt 1 ]; then
        echo "Multiple directories found:"
        dirs+=("Quit")  # Add Quit as the last option
        select dir in "${dirs[@]}"; do
            if [[ "$dir" == "Quit" ]]; then
                echo "Exiting selection."
                break
            elif [[ -d "$dir" ]]; then
                cd "$dir"
                echo "Changed to directory: $dir."
                break
            else
                echo "Invalid choice or directory does not exist: $dir"
                continue
            fi
        done
    else
        echo "No valid directory found."
    fi
}

# Example aliases
alias code="code-insiders"
alias cr="cursor"
alias gates="bash ~/startGates.sh"
alias search="google"
alias vim="nvim"
alias python="python3"
alias pip="pip3"
alias pip1="pip"
alias rmrf="rm -rf"
alias ls='gls --group-directories-first --color=auto'
#alias ls -lah='gls -lah --group-directories-first --color=auto'
alias detach="tmux detach"
alias cl="clear"
alias c="clear && neofetch | lolcat"
alias ta="tmux a -t $(date '+%A')"
alias tn="tmux new -s $(date '+%A') || tmux a -t $(date '+%A')"
alias lsd="ls -lh --time-style=+%D | grep $(date +%D)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Angular CLI autocompletion.
source <(ng completion script)

# Created by `pipx` on 2024-06-25 21:22:58
export PATH="$PATH:/Users/chris/.local/bin"
