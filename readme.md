
There is a work in progress on this repository...


# Choppydev Ricing Mk 1 

This is my first linux ricing, feel free to star repository, fork and contribute

## Requirements :
 - Arch 
 - Yay
 
## How to install :

``` ./installer.sh ```

Add your monitor preferences in `~/.config/hypr/hyprland.conf` 

# Keybinds 

## 🧭 General
| Shortcut        | Action                           |
| --------------- | -------------------------------- |
| `SUPER + Q`     | Launch terminal                  |
| `SUPER + C`     | Kill active window               |
| `SUPER + M`     | Shutdown menu (or exit Hyprland) |
| `SUPER + E`     | Open file manager                |
| `SUPER + V`     | Toggle floating                  |
| `SUPER + Space` | Rofi app launcher                |
| `SUPER + P`     | Toggle pseudo (dwindle)          |
| `SUPER + J`     | Toggle split (dwindle)           |
| `SUPER + F`     | Fullscreen (state 3)             |
| `SUPER + L`     | Lock screen (hyprlock)           |

## 🪟 Window Focus

| Shortcut    | Direction   |
| ----------- | ----------- |
| `SUPER + ←` | Focus left  |
| `SUPER + →` | Focus right |
| `SUPER + ↑` | Focus up    |
| `SUPER + ↓` | Focus down  |

## 🔄 Window Swap

| Shortcut            | Direction  |
| ------------------- | ---------- |
| `SUPER + SHIFT + ←` | Swap left  |
| `SUPER + SHIFT + →` | Swap right |
| `SUPER + SHIFT + ↑` | Swap up    |
| `SUPER + SHIFT + ↓` | Swap down  |

## 🖱 Mouse Actions

| Shortcut      | Action        |
| ------------- | ------------- |
| `SUPER + LMB` | Move window   |
| `SUPER + RMB` | Resize window |


## 🖥 Workspaces (Split Mode)

| Shortcut    | Workspace    |
| ----------- | ------------ |
| `SUPER + 1` | Workspace 1  |
| `SUPER + 2` | Workspace 2  |
| `SUPER + 3` | Workspace 3  |
| `SUPER + 4` | Workspace 4  |
| `SUPER + 5` | Workspace 5  |
| `SUPER + 6` | Workspace 6  |
| `SUPER + 7` | Workspace 7  |
| `SUPER + 8` | Workspace 8  |
| `SUPER + 9` | Workspace 9  |
| `SUPER + 0` | Workspace 10 |

## Move Window to Workspace
| Shortcut              | Action                        |
| --------------------- | ----------------------------- |
| `SUPER + SHIFT + 1–0` | Move window to workspace 1–10 |


## 📌 Special Workspace

| Shortcut            | Action                           |
| ------------------- | -------------------------------- |
| `SUPER + S`         | Toggle special workspace         |
| `SUPER + SHIFT + S` | Move window to special workspace |

## 🖱 Workspace Cycling

| Shortcut              | Action                             |
| --------------------- | ---------------------------------- |
| `SUPER + Scroll Down` | Next workspace (monitor-local)     |
| `SUPER + Scroll Up`   | Previous workspace (monitor-local) |
| `SUPER + CTRL + →`    | Next workspace (monitor-local)     |
| `SUPER + CTRL + ←`    | Previous workspace (monitor-local) |

## 📸 Screenshots
| Shortcut        | Action                            |
| --------------- | --------------------------------- |
| `Print`         | Select area → Clipboard           |
| `SHIFT + Print` | Fullscreen → Clipboard            |
| `CTRL + Print`  | Select area → Save to `~/Images/` |


# Roadmap :
- [X] Hyprland
- [X] Keybinds
- [X] Animations
- [X] Waybar
- [X] Rofi
- [ ] SwayNc customization
- [ ] Nvim customization
- [ ] VSCode Theme
- [ ] File manager
- [ ] Hyprlock



## To find next : 
- Notification center
- VSCODE config
- Zed Config
- Dunst (noficiations)
- Neofetch
- Pywall
- Wlogout
- Hyprexpo
- SwayNC
- Clipboard history


## Apps

- hyrpland (desktop manager)

- oh my zsh (zsh)

- rofi (launcher)

- hyprpaper (wallpaper manager)

- SwayNC (notififaction deamon)

- waybar (status bar)

- brightnessctl (brightness manager)

- pamixer (volume control)



## Tips & tricks to rice deeper
Restart waybar : 

``` pkill waybar && hyprctl dispatch exec waybar ```


### R eferences
See https://wiki.archlinux.org/title/Hyprland#Display_settings

## Color Palette : 

#A67C5B

#B5926D

#C9AD7F

#DECFAC

#F6F7DD

#AAED86

#79E671

#4ADD61

#108F42
