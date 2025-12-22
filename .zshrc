
# guard: only interactive shells
case $- in
  *i*) ;;
  *) return ;;
esac

# move to home
builtin cd ~

# --- Functions ---
fullfetch() {
    fastfetch --show-errors -s \
        "Title:Break:Separator:Break:Host:Chassis:Board:BIOS:Bootmgr:TPM:CPU:CPUCache:CPUUsage:GPU:OpenGL:OpenCL:Vulkan:Memory:Swap:PhysicalMemory:Disk:PhysicalDisk:DiskIO:Zpool:Btrfs:PowerAdapter:Battery:Processes:Loadavg:Separator:Break:OS:Kernel:InitSystem:Packages:Shell:Terminal:TerminalFont:TerminalSize:TerminalTheme:Editor:DE:Theme:WM:WMTheme:Icons:Cursor:Font:Version:Separator:Break:Display:Monitor:Brightness:Wallpaper:Separator:Break:LocalIp:PublicIp:Wifi:DNS:NetIO:Bluetooth:BluetoothRadio:Separator:Break:Keyboard:Mouse:Gamepad:Camera:Sound:Media:Player:Separator:Break:Locale:DateTime:Uptime:Users:Weather:Separator:Break:Colors:Custom:Command"
}

kl() {
    "$HOME/bin/kl.sh"
}

# --- Editor ---
alias nvim=/usr/local/bin/nvim
export EDITOR="nvim"
export VISUAL="nvim" 

# --- Aliases ---
alias f='fuck'
alias cpu='fastfetch --logo none -s CPUUsage'
alias gitoops='git add .; git commit --amend --no-edit'
alias ff='~/bin/onLoad.sh'
alias dt='fastfetch --logo none -s DateTime'
alias zsh='nvim ~/.shrc'
alias col='nvim ~/bin/onLoad.sh'
alias cl='clear; cd ~; ~/bin/onLoad.sh'

# --- Prompt ---
# Enable variable substitution in zsh
if [ -n "$ZSH_VERSION" ]; then
    setopt PROMPT_SUBST
fi

# Determine displayed username
displayedUsername="$USER"
if [ "$USER" = "kauri" ]; then
    displayedUsername="echo"
fi

# Set current working directory variable
workingDir="\w"  # bash
if [ -n "$ZSH_VERSION" ]; then
    workingDir="%1~"  # zsh
fi

# Set prompt colors (dark gray background, white text)
if [ -n "$BASH_VERSION" ]; then
    # Bash uses ANSI escape codes
    PS1="${displayedUsername} [${workingDir}]:"
elif [ -n "$ZSH_VERSION" ]; then
    # Zsh uses %K (background), %F (foreground)
    PROMPT="${displayedUsername} [${workingDir}]: "
fi


# --- The Fuck ---
eval "$(thefuck --alias)"

# --- Starship ---
eval "$(starship init zsh)"

# --- Load other scripts ---
[ -r "$HOME/bin/onLoad.sh" ] && . "$HOME/bin/onLoad.sh"

# --- Homebrew fzf base (Intel Mac) ---
if [ -d "/usr/local/opt/fzf" ]; then
    export FZF_BASE="/usr/local/opt/fzf"
fi

