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

function wallup
    pkill hyprpaper
    hyprpaper & disown
end

set fish_greeting

# LF_ICONS environment variable
set -x LF_ICONS "*.ipynb=󰌠:*.iso=:~/Pictures/Screenshots/=󰹑:*.fish=:bash_profile=:*.nvim=:*.enc=:*.webp=:*.xlsm=󱎏:*.xls=󱎏:*.docx=󱎒:*.odp=󱎐:*.xlsx=󱎏:*.csv=:*.r=:*.doc=󱎏:*.list=:*.srt=󰨖:*.conf=:*.ods=:*.txt=:*.odt=󱎒:*.epub=󰂺:*.bib=:*.tex=:*.7z=:*.aac=:*.ace=:*.alz=:*.arc=:*.arj=:*.asf=:*.atom=:*.au=:*.avi=:*.bash=:*.bash_history=:*.bashprofile=:*.bashrc=:*.bmp=:*.bz2=:*.bz=:*.c=:*.cab=:*.cc=:*.cfg=:*.cgm=:*.clang-format=:*.clj=:*.cmd=:*.coffee=:*.cpio=:*.cpp=:*.css=:*.d=:*.dart=:*.deb=:*.dl=:*.DS_Store=:*.dwm=:*.dz=:*.ear=:*.emf=:*.env=:*.erl=:*.esd=:*.exs=:*.flac=:*.flc=:*.fli=:*.flv=:*.fs=:*.gif=:*.git=:*.gitattributes=:*.gitconfig=:*.github=:*.gitignore=:*.gitignore_global=:*.gitkeep=:*.gitmodules=:*.gl=:*.go=:*.gz=:*.h=:*.hh=:*.hidden=:*.hpp=:*.hs=:*.html=:*.hyper.js=:*.jar=:*.java=:*.jl=:*.jpeg=:*.jpg=:*.js=:*.json=:*.jsx=:*.lha=:*.lrz=:*.lua=:*.lz4=:*.lz=:*.lzh=:*.lzma=:*.lzo=:*.m2v=:*.m4a=:*.m4v=:*.map=:*.md=:*.mdx=:*.mid=:*.midi=:*.mjpeg=:*.mjpg=:*.mka=:*.mkv=󱜏:*.mng=:*.mov=󱜏:*.mp3=:*.mp4=󱜏:*.mp4v=󱜏:*.mpc=:*.mpeg=:*.mpg=:*.nix=:*.npmignore=:*.npmrc=:*.nuv=:*.nvmrc=:*.oga=:*.ogg=:*.ogm=:*.ogv=:*.ogx=:*.opus=:*.pbm=:*.pcx=:*.pdf=:*.pgm=:*.php=:*.pl=:*.png=:*.ppm=:*.pro=:*.ps1=:*.py=󰌠:*.qt=:*.ra=:*.rar=:*.rb=:*.rm=:*.rmvb=:*.rpm=:*.rs=:*.rvm=:*.rz=:*.sar=:*.scala=:*.sh=:*.skhdrc=:*.sol=ﲹ:*.spx=:*.svg=:*.svgz=:*.swm=:*.t7z=:*.tar=:*.taz=:*.tbz2=:*.tbz=:*.tga=:*.tgz=:*.tif=:*.tiff=:*.tlz=:*.tmux.conf=:*.trash=:*.ts=:*.tsx=:*.txz=:*.tz=:*.tzo=:*.tzst=:*.vim=:*.vimrc=:*.vob=:*.vscode=:*.war=:*.wav=:*.webm=󱜏:*.wim=:*.xbm=:*.xcf=:*.xpm=:*.xspf=:*.xwd=:*.xz=:*.yabairc=:*.yaml=:*.yarn-integrity=:*.yarnrc=:*.yml=פּ:*.yuv=:*.z=:*.zip=:*.zoo=:*.zprofile=:*.zsh=:*.zsh_history=:*.zshrc=:*.zst=:*bin=:*config=:*docker-compose.yml=:*dockerfile=:*gradle=:*gruntfile.coffee=:*gruntfile.js=:*gruntfile.ls=:*gulpfile.coffee=:*gulpfile.js=:*gulpfile.ls=:*include=:*lib=:*localized=:*node_modules=:*package.json=:*rubydoc=:*tsconfig.json=:*yarn.lock=:di=:dt=:ex=:fi=:ln=:or=:ow=:st=:tw=:~/MyDrive/=󱛟"

# lf wrapper function
function lf
    set tmp (mktemp)
    command lf -last-dir-path="$tmp" $argv
    if test -f "$tmp"
        set dir (cat "$tmp")
        if test -d "$dir" -a "$dir" != (pwd)
            cd "$dir"
        end
    end
    rm -f "$tmp"
end

# always start lf
lf

