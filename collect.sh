cp ~/.profile . 

cp ~/.zshrc .
cp ~/.fzf-completion.zsh .
cp ~/.fzf-key-bindings.zsh .

cp -r ~/.config/i3 .
cp -r ~/.config/i3status .
cp -r ~/.config/rofi .

cp -r ~/.scripts .
rm -f .scripts/bg.jpg

cp -r ~/.config/alacritty .
cp -r ~/.config/starship.toml .
mkdir -p tmux
cp -r ~/.config/tmux/tmux.conf tmux/tmux.conf
cp -r ~/.config/tmux/theme.tmux tmux/theme.tmux

cp -r ~/.config/nvim .
