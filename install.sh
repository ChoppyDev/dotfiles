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
# sudo pacman -Syu --noconfirm
# clear


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



info "Installing split-monitor-plugin"
yay -S --needed --noconfirm cmake cpio pkg-config git g++ gcc
hyprpm update
hyprpm add https://github.com/Duckonaut/split-monitor-workspaces # Add the plugin repository
hyprpm enable split-monitor-workspaces # Enable the plugin
hyprpm reload # Reload the plugins

# clear

# ==========================
#        Backup config    =
# ==========================

info "Creating backup configs for $(date)"

BACKUP_DIR="$HOME/.choppydev-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p $BACKUP_DIR


# ==========================
# Dotfiles installation    =
# ==========================

# info "Installing dotfiles..."




cp -r "$HOME/.config" "$BACKUP_DIR/" 2>/dev/null || true


success "Successfully backup config files"



# todo : 
# install slurp
# install all missing plugins
# install split-monitor-workspaces split-monitor-workspaces
info "Installing configurations" 
CONFIGS=(hypr waybar rofi kitty)

for cfg in "${CONFIGS[@]}"; do
    info "removing $HOME/.config/$cfg"
    rm -rf "$HOME/.config/$cfg"
done

success "Successfully removed files"

mkdir -p ~/.config

for cfg in "${CONFIGS[@]}"; do
    info "adding $HOME/.config/$cfg"
    cp -r ".config/$cfg/" "$HOME/.config/$cfg"
done

# cp -r ".config/" "$HOME/.config/"
success "Configs deployed."

echo "Done."

# echo $HOME