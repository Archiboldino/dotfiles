source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    true
end

set PATH $HOME/bin $HOME/.local/bin /usr/local/bin $HOME/.config/scripts $HOME/.cargo/bin $PATH
set EDITOR nvim

status --is-interactive; and source (jenv init -|psub)

set --universal zoxide_cmd cd

bind ctrl-x,ctrl-e edit_command_buffer

alias fm=yazi
alias vim=nvim
alias yas="yes | yay"
alias weather="curl wttr.in"
alias icat="kitten icat"
alias cat=bat
alias che="chezmoi edit --apply"
alias chel="lazygit -p ~/.local/share/chezmoi/"
alias g=git
