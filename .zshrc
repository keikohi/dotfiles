# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if which pyenv > /dev/null; then
#     eval "$(pyenv init -)";
# fi

# zsh用 ============================================================

# zplug

# if [[ ! -d ~/.zplug ]];then
#   git clone https://github.com/zplug/zplug ~/.zplug
# fi

export export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "b4b4r07/enhancd", use:init.sh

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "jesseduffield/lazygit"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

# alias
alias zshrc='code ~/.zshrc'

# history
export LANG=ja_JP.UTF-8
HISTFILE=$HOME/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history

# zsh用 ============================================================

alias dmm='open -na "Google Chrome.app" --args --app="https://book.dmm.com"'

alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

alias ..='cd ..'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias c='clear'
alias cpwd='pwd | tr -d "\n" | pbcopy'
alias dev='cd ~/dev'

# alias code='code -a'

#google検索
google() { open -na "Google Chrome.app" --args "http://www.google.com/search?q= $1"; }
alias g="google"


# awk
calc() {
    awk "BEGIN {print $*}"
}

alias tac='tail -r'

# bashの出力について
export PS1="%n👉:%c $ "

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'


function cd {
  builtin cd "$@" && ls
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

