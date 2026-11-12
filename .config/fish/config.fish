# ~/.config/fish/config.fish

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ff 'fastfetch'
alias update 'sudo pacman -Syu'
alias off 'shutdown now'
alias cache 'sudo pacman -Scc'
alias storage='df -h /'
alias blue 'pkill gammastep'
alias red 'gammastep'
alias thispc 'cat /sys/devices/virtual/dmi/id/product_name'
alias pape 'pkill hyprpaper; nohup hyprpaper >/dev/null 2>&1 &'
alias pazi 'yazi'


function waystart
    pkill -x waybar 2>/dev/null
    sleep 0.1
    nohup waybar >/dev/null 2>&1 </dev/null &
    disown
end

function wallup
    pkill hyprpaper
    hyprpaper & disown
end

set fish_greeting

# Yazi wrapper: preserve directory on exit
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"

    if read -z cwd < "$tmp"
        if test -d "$cwd"; and test "$cwd" != "$PWD"
            builtin cd -- "$cwd"
        end
    end

    command rm -f -- "$tmp"
end

# Automatically start Yazi in new terminals
if status is-interactive; and not set -q AUTO_YAZI_ACTIVE
    set -gx AUTO_YAZI_ACTIVE 1
    y
    set -e AUTO_YAZI_ACTIVE
end
