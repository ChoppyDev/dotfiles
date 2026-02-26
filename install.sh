echo "Installing necessary packages..."




RESET="\e[0m"
BOLD="\e[1m"
PURPLE="\e[38;5;141m"
CYAN="\e[38;5;51m"
GREEN="\e[38;5;82m"
RED="\e[38;5;196m"

info() { echo -e "${CYAN}➜ $1${RESET}"; }
success() { echo -e "${GREEN}✔ $1${RESET}"; }
error() { echo -e "${RED}✘ $1${RESET}"; }

# ==========================
#        Safety first      =
# ==========================

if [ "$(id -u)" -eq 0 ]; then
    error "Do NOT run as root."
    exit 1
fi

if ! command -v pacman &>/dev/null; then
    error "Arch Linux required to run this script"
    exit 1
fi

info "Updating system..."
sudo pacman -Syu --noconfirm
clear


# ==========================
# Packages installation    =
# ==========================
info "Installing missing packages"

yay -S --needed --noconfirm \
  hyprland xdg-desktop-portal-hyprland \
  waybar rofi hyprlock wlogout swaync \
  grim slurp wl-clipboard hyprpicker hyprshot \
  nautilus pavucontrol  \
  ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk \
  noto-fonts-emoji otf-geist-mono


# ==========================
# Dotfiles installation    =
# ==========================

info "Installing dotfiles..."

# todo : 
# install slurp
# install all missing plugins
# install split-monitor-workspaces split-monitor-workspaces
mkdir ~/.config

# ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
# ln -sf ~/dotfiles/.config/waybar ~/.config/waybar
# ln -sf ~/dotfiles/.config/dunst ~/.config/dunst
# ln -sf ~/dotfiles/.config/rofi ~/.config/rofi

echo "Done."