[[ -s "/usr/local/rvm" ]] && source "/usr/local/rvm/scripts"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# FZF Path configuration
export FZF_BASE="/home/vuthanhdat/.fzf"
export ZSH_DOTENV_FILE="/home/vuthanhdat/.env"
export ZSH_DOTENV_PROMPT=false

_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=(histdb_top completion)

#fix high cpu 
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XMODIFIERS="@im=ibus"
#export PATH="/home/vuthanhdat/.gem/ruby/2.6.0/bin:$PATH"

export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH="/home/vuthanhdat/.oh-my-zsh"
source ~/.profile
source ~/.profile_functions

#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	cp
	tmux
	dotenv
    docker
	git
	zsh-histdb
    zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
	gitfast
	fzf
	per-directory-history
	ssh-agent
	fancy-ctrl-z
    aliases
    thefuck
    )
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# TMUX configuration
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_UNICODE='tmux -u'
# Power9kTheme Customization
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_MODE='awesome-fontconfig'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)
export PATH=$HOME/.config/nvcode/utils/bin:$PATH

#source ~/.env
