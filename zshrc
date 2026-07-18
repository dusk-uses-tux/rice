# ---------------------------------
# Options
# ---------------------------------
setopt prompt_subst
setopt append_history
setopt share_history
setopt auto_menu
setopt complete_in_word
setopt auto_list
setopt correct_all

# ---------------------------------
# History
# ---------------------------------
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.zsh_history"

# ---------------------------------
# PATH
# ---------------------------------
path=(
    "$HOME/.cargo/bin"
    "$HOME/.opencode/bin"
    $path
)

# ---------------------------------
# Icons
# ---------------------------------
typeset -A ICONS

ICONS=(
    # --- Home / User ---
    "~"              ""
    "home"           "󰋜"
    "Users"           "󰋜"

    # --- Configs & Caches ---
    ".config"        ""
    ".cache"         "󰃨"
    ".local"         "󰒏"
    ".mozilla"       ""
    ".npm"           ""
    ".ssh"           "󰒋"
    ".gnupg"         "󰒃"
    ".themes"        "󰉦"
    ".icons"         "󰀶"
    ".minecraft"     "󰍳"

    # --- macOS Specific ---
    "Applications"   "󰀻"
    "Library"        "󰔛"
    "System"         "󰒓"
    "Volumes"        "󰋊"
    "Network"        "󰌗"
    "Cores"          "󰊴"

    # --- Linux Root Directories ---
    "usr"            ""
    "etc"            ""
    "lib"            "󰲓"
    "bin"            ""
    "sbin"           ""
    "tmp"            "󰪺"
    "var"            "󰀼"
    "sys"            "󰒓"
    "proc"           "󰘚"
    "boot"           "󰊅"
    "mnt"            "󰋊"
    "media"          "󰋊"
    "opt"            "󰕧"
    "run"            "󰊌"
    "srv"            "󰖟"
    "dev"            "󰊫"

    # --- BSD Specific (FreeBSD, etc.) ---
    "ports"          "󰏓"
    "src"            "󰗀"
    "obj"            "󰒍"
    "distfiles"      "󰇚"
    "packages"       "󰏓"

    # --- NixOS Specific ---
    "nix"            "󱄅"
    "store"          "󰏓"

    # --- Standard User Directories ---
    "Desktop"        ""
    "Documents"      "󰈙"
    "Downloads"      "󰉍"
    "Music"          "󰝚"
    "Pictures"       "󰉏"
    "Videos"         "󰕧"

    # --- Dev & Projects ---
    "Projects"       "󰲋"
    "Games"          "󰊗"
    "Notes"          "󱞎"
    "Work"           "󰖷"
    "git"            "󰊢"
    ".git"           "󰊢"
    "node_modules"   ""
    "build"          "󰆧"
    "dist"           "󰎆"
    "venv"           "󰆨"
)

# ---------------------------------
# Path formatter
# ---------------------------------
path_with_icons() {
    local path="${PWD/#$HOME/~}"
    local parts result="" icon

    local IFS='/'
    parts=(${=path})

    for part in "${parts[@]}"; do
        [[ -z "$part" ]] && continue

        icon="${ICONS[$part]}"

        if [[ -n "$icon" ]]; then
            result+="$icon "
        else
            result+="$part "
        fi

        result+="/ "
    done

    print -r -- "${result% / }"
}

# ---------------------------------
# Prompt
# ---------------------------------
PROMPT='%n@%m $(path_with_icons) %# '
# ---------------------------------
# Completion
# ---------------------------------
autoload -Uz compinit
compinit

fpath=(
    ~/.zsh/zsh-completions
    $fpath
)

# ---------------------------------
# Aliases
# ---------------------------------
alias ff='fastfetch'
alias pf='pfetch'
alias gc='git clone'
alias ,/='zsh '
alias ls='eza --icons'
alias l='eza --icons'
alias clock='tty-clock -c -C 7 -t -B'
alias run0='run0 --background='
# ---------------------------------
# Keybinds
# ---------------------------------
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
