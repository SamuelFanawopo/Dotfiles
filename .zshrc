# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Enable plugins
plugins=(git tmux zsh-autosuggestions zsh-syntax-highlighting)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias ll='ls -lah'
alias gs='git status'
alias gp='git pull'
alias gc='git commit'
alias gca='git commit -a'
alias gl='git log --oneline --graph --decorate'

# Export PATH
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Enable Powerlevel10k prompt (if using)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Additional Customizations
# Add any other configurations or environment variables below
