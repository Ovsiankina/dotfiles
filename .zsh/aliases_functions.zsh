function ls() {
    local args="$@"
    if [[ "$args" == *"-l"* ]]; then
        eza --long --icons=always "$@"
    elif [[ "$args" == *"-g"* ]]; then
        eza --color=always --long --git -a --git-ignore --no-filesize --icons=always --no-time --no-user --no-permissions "$@"
    else
        eza --color=always -x --git --no-filesize --icons=always --no-time --no-user --no-permissions "$@"
    fi
}

function tree(){
    eza -T
}

function current_vi_mode() {
  case $ZVM_MODE in
    n) echo "NORMAL" ;;
    i) echo "INSERT" ;;
    v) echo "VISUAL" ;;
    c) echo "COMMAND" ;;
    r) echo "REPLACE" ;;
    *) echo "UNKNOWN" ;;
  esac
}

yt() {
  if [[ -z "$1" ]]; then
    echo "Usage: yt <YouTube URL>"
    return 1
  fi
  DISPLAY= mpv --vo=kitty "$1"
}
