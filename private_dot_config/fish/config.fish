source /usr/share/cachyos-fish-config/cachyos-config.fish
source ~/.config/fish/secrets.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    true
end

set PATH $HOME/bin $HOME/.local/bin /usr/local/bin $HOME/.config/scripts $HOME/.cargo/bin $PATH
set -gx EDITOR nvim

set --universal zoxide_cmd cd

bind ctrl-x,ctrl-e edit_command_buffer

alias s="sesh picker"
alias fm=yazi
alias vim=nvim
alias yas="yes | yay"
alias weather="curl wttr.in"
alias icat="kitten icat"
alias cat=bat
alias che="chezmoi edit --apply"
alias chel="lazygit -p ~/.local/share/chezmoi/"
alias g=git
alias diff="nvim -d"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
