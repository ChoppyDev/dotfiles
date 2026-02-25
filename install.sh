echo "Installing dotfiles..."

mkdir ~/.config

ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
ln -sf ~/dotfiles/.config/waybar ~/.config/waybar
ln -sf ~/dotfiles/.config/dunst ~/.config/dunst

echo "Done."