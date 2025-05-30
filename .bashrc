#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias update 'sudo pacman -Syu'
alias cache 'sudo pacman -Scc'
PS1='[\u@\h \W]\$ '

export LF_ICONS="*.fish= :*.bash_profile=:.nvim=:*.enc=:*.webp=:*.xls=󱎏:*.docx=󱎒:*.odp=󱎐:*.xlsx=󱎏:*.csv=:*.r=:*.doc=󱎏:*.list=:*.srt=󰨖:*.conf=:*.ods=󱎏:*.txt=:*.odt=󱎒:*.epub=󰂺:*.bib=:*.tex=:*.7z=:*.aac=:*.ace=:*.alz=:*.arc=:*.arj=:*.asf=:*.atom=:*.au=:*.avi=:*.bash=:*.bash_history=:*.bashprofile=:*.bashrc=:*.bmp=:*.bz2=:*.bz=:*.c=:*.cab=:*.cc=:*.cfg=:*.cgm=:*.clang-format=:*.clj=:*.cmd=:*.coffee=:*.cpio=:*.cpp=:*.css=:*.d=:*.dart=:*.deb=:*.dl=:*.DS_Store=:*.dwm=:*.dz=:*.ear=:*.emf=:*.env=:*.erl=:*.esd=:*.exs=:*.flac=:*.flc=:*.fli=:*.flv=:*.fs=:*.gif=:*.git=:*.gitattributes=:*.gitconfig=:*.github=:*.gitignore=:*.gitignore_global=:*.gitkeep=:*.gitmodules=:*.gl=:*.go=:*.gz=:*.h=:*.hh=:*.hidden=:*.hpp=:*.hs=:*.html=:*.hyper.js=:*.jar=:*.java=:*.jl=:*.jpeg=:*.jpg=:*.js=:*.json=:*.jsx=:*.lha=:*.lrz=:*.lua=:*.lz4=:*.lz=:*.lzh=:*.lzma=:*.lzo=:*.m2v=:*.m4a=:*.m4v=:*.map=:*.md=:*.mdx=:*.mid=:*.midi=:*.mjpeg=:*.mjpg=:*.mka=:*.mkv=󰎁:*.mng=:*.mov=󰎁:*.mp3=:*.mp4=󰎁:*.mp4v=󰎁:*.mpc=:*.mpeg=:*.mpg=:*.nix=:*.npmignore=:*.npmrc=:*.nuv=:*.nvmrc=:*.oga=:*.ogg=:*.ogm=:*.ogv=:*.ogx=:*.opus=:*.pbm=:*.pcx=:*.pdf=:*.pgm=:*.php=:*.pl=:*.png=:*.ppm=:*.pro=:*.ps1=:*.py=󰌠:*.qt=:*.ra=:*.rar=:*.rb=:*.rm=:*.rmvb=:*.rpm=:*.rs=:*.rvm=:*.rz=:*.sar=:*.scala=:*.sh=:*.skhdrc=:*.sol=ﲹ:*.spx=:*.svg=:*.svgz=:*.swm=:*.t7z=:*.tar=:*.taz=:*.tbz2=:*.tbz=:*.tga=:*.tgz=:*.tif=:*.tiff=:*.tlz=:*.tmux.conf=:*.trash=:*.ts=:*.tsx=:*.txz=:*.tz=:*.tzo=:*.tzst=:*.vim=:*.vimrc=:*.vob=:*.vscode=:*.war=:*.wav=:*.webm=:*.wim=:*.xbm=:*.xcf=:*.xpm=:*.xspf=:*.xwd=:*.xz=:*.yabairc=:*.yaml=פּ:*.yarn-integrity=:*.yarnrc=:*.yml=פּ:*.yuv=:*.z=:*.zip=:*.zoo=:*.zprofile=:*.zsh=:*.zsh_history=:*.zshrc=:*.zst=:*bin=:*config=:*docker-compose.yml=:*dockerfile=:*gradle=:*gruntfile.coffee=:*gruntfile.js=:*gruntfile.ls=:*gulpfile.coffee=:*gulpfile.js=:*gulpfile.ls=:*include=:*lib=:*localized=:*node_modules=:*package.json=:*rubydoc=:*tsconfig.json=:*yarn.lock=:di=:dt=:ex=:fi=:ln=:or=:ow=:st=:tw=:"

#!/bin/sh

lf () {
    tmp="$(mktemp)"
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
    rm -f "$tmp"
}


lf

