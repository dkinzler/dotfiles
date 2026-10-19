# Vi mode
fish_vi_key_bindings

# Default "ctl-f" is not default in vi mode
bind --mode insert ctrl-f accept-autosuggestion

# Overwrite function to not show vi mode indicator in prompt
function fish_mode_prompt
end

# FZF
# Always start dir search at $HOME instead of the current dir
set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --exclude .git . $HOME'
fzf --fish | source

# Git shortcuts
abbr --add gs 'git status'
abbr --add ga 'git add'
abbr --add gc 'git commit'
abbr --add gd 'git diff'
abbr --add gl 'git log'
abbr --add gp 'git push'
