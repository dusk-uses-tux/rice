# System-wide profile for interactive zsh(1) login shells.
# FORK OF APPLES ZSH CONFIG

if [ -z "$LANG" ]; then
	export LANG=C.UTF-8
fi

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

export SHELL='zsh'
export XDG_CURRENT_DESKTOP='DriftWM (wayland compositor)'
export PF_INFO='ascii title os host uptime de memory'
