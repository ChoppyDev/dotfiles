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

# ==========================
#           Helpers        =
# ==========================
RESET="\e[0m"
BOLD="\e[1m"
PURPLE="\e[38;5;141m"
CYAN="\e[38;5;51m"
GREEN="\e[38;5;82m"
RED="\e[38;5;196m"
APPNAME="Choppy Mk1"


info() { echo -e "${CYAN}➜ $1${RESET}"; }
success() { echo -e "${GREEN}✔ $1${RESET}"; }
error() { echo -e "${RED}✘ $1${RESET}"; }

install() {
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

    success "Sucessfully installed packages"

    info "Installing split-monitor-plugin"
    yay -S --needed --noconfirm cmake cpio pkg-config git g++ gcc
    hyprpm update
    hyprpm add https://github.com/Duckonaut/split-monitor-workspaces # Add the plugin repository
    hyprpm enable split-monitor-workspaces # Enable the plugin
    hyprpm reload # Reload the plugins

}

update() {

    # ==========================
    #        Backup config     =
    # ==========================

    info "Creating backup configs for $(date)"

    BACKUP_DIR="$HOME/.choppydev-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p $BACKUP_DIR
    cp -r "$HOME/.config" "$BACKUP_DIR/" 2>/dev/null || true

    success "Successfully backup config files"

    # ==========================
    # Dotfiles installation    =
    # ==========================

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

    success "Configs deployed."

    info "Cleaning old wallpapers"
    rm -rf "$HOME/.config/choppydev.mk1/"
    success "Wallpapers cleaned"

    info "Moving wallpapers"

    mkdir "$HOME/.config/choppydev.mk1"
    cp -r "./wallpapers/" "$HOME/.config/choppydev.mk1/wallpapers/"
    success "Wallpapers moved"
    info "Reloading hyprpaper..."
    pkill hyprpaper && hyprctl dispatch exec hyprpaper
    success "Hyprpaper reloaded"
    info "Reloading waybar..."
    pkill waybar && hyprctl dispatch exec waybar
    success "Waybar reloaded"
    info "Reloading Hyprland..."
    hyprctl reload
    success "Hyprland reloaded"

    echo "$APPNAME installed."
}


OPTIONS=("update" "install")
echo "Update dotfiles or install $APPNAME ?" 
select ANSWER in ${OPTIONS[@]}; do 
    if [ -n "$ANSWER" ]; then

        if [ "$ANSWER" = "update" ]; then
            update
        fi
        if [ "$ANSWER" = "install" ]; then
            install
            update
        fi
        break
    else
        error "This choice doesn't  exist ! "
    fi
done

