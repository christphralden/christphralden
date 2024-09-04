#!/usr/bin/env zsh

git() {
    case "$1" in
        clean)
            shift
            git clean -df "$@"
            ;;
        nuke)
            shift
            git clean -df && git reset HEAD --hard
            ;;
        *)
            command git "$@"
            ;;
    esac
}

docker() {
    case "$1" in
        clean)
            shift
            docker rm $(docker ps --filter=status=exited --filter=status=created -q)
            ;;
        rmi-clean)
            shift
            docker rmi $(docker images -a --filter=dangling=true -q)
            ;;
        builder-prune)
            shift
            docker builder prune
            ;;
        *)
            command docker "$@"
            ;;
    esac
}

conf() {
    case "$1" in
        zshrc)
            nvim ~/.zshrc
            ;;
        warp)
            nvim ~/.warp/
            ;;
        aerospace)
            nvim ~/.config/aerospace/
            ;;
        nvim)
            nvim ~/.config/nvim/
            ;;
        tmux)
            nvim ~/.config/tmux/
            ;;
        scripts)
            nvim ~/.local/bin/scripts/
            ;;
        wez)
            nvim ~/.config/wezterm/
            ;;

        *)
            echo "Unknown configuration command: $1"
            ;;
    esac
}

alias ls='lsd -hA --group-dirs first'
alias tree='tree -a -L 4 -h -f'
alias ip='ipconfig getifaddr en0'
alias detach='tmux detach'
alias tnew='tmux new -s'
alias attach='tmux attach -t'
alias tatt='tmux attach'
alias lsal='bat $HOME/.local/bin/scripts/alias/.listalias'
alias copy_dotfiles='$HOME/.local/bin/scripts/dotfiles/copy.sh'
