echo "Installing dotfiles..."

mkdir ~/.config

ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
ln -sf ~/dotfiles/.config/waybar ~/.config/waybar
ln -sf ~/dotfiles/.config/dunst ~/.config/dunst
ln -sf ~/dotfiles/.config/rofi ~/.config/rofi

echo "Done."