function ls() {
    local args="$@"
    if [[ "$args" == *"-l"* ]]; then
        eza --long "$@"
    else
        eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions "$@"
    fi
}

function colorp() {
  confirm="y"
  colors=()

  while [ "$confirm" = "y" ]; do
    # Perform the task (you can replace this with your actual task)
    color=$(grim -g "$(slurp -p)" -t ppm - | magick - -format '%[pixel:p{0,0}]' txt: | awk 'NR==2 {print $3}')
    r=$(echo $color | cut -c 2-3)
    g=$(echo $color | cut -c 4-5)
    b=$(echo $color | cut -c 6-7)
    colors+=("\033[48;2;$((16#$r));$((16#$g));$((16#$b))m  \033[0m $color")

    # Prompt the user to continue or stop
    echo "Continue? (y/n): "
    read confirm
  done

  # Display all captured colors
  for color_code in "${colors[@]}"; do
    echo -e "$color_code"
  done
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

function catppuccin() {
  local macchiato_colors=(
    "#f4dbd6" "#f0c6c6" "#f5bde6" "#c6a0f6" "#ed8796" "#ee99a0"
    "#f5a97f" "#eed49f" "#a6da95" "#8bd5ca" "#91d7e3" "#7dc4e4"
    "#8aadf4" "#b7bdf8" "#cad3f5" "#b8c0e0" "#a5adcb" "#939ab7"
    "#8087a2" "#6e738d" "#5b6078" "#494d64" "#363a4f" "#24273a"
    "#1e2030" "#181926"
  )

  local frappe_colors=(
    "#f2d5cf" "#eebebe" "#f4b8e4" "#ca9ee6" "#e78284" "#ea999c"
    "#ef9f76" "#e5c890" "#a6d189" "#81c8be" "#99d1db" "#85c1dc"
    "#8caaee" "#babbf1" "#c6d0f5" "#b5bfe2" "#a5adce" "#949cbb"
    "#838ba7" "#737994" "#626880" "#51576d" "#414559" "#303446"
    "#292c3c" "#232634"
  )

  local latte_colors=(
    "#dc8a78" "#dd7878" "#ea76cb" "#8839ef" "#d20f39" "#e64553"
    "#fe640b" "#df8e1d" "#40a02b" "#179299" "#04a5e5" "#209fb5"
    "#1e66f5" "#7287fd" "#4c4f69" "#5c5f77" "#6c6f85" "#7c7f93"
    "#8c8fa1" "#9ca0b0" "#acb0be" "#bcc0cc" "#ccd0da" "#eff1f5"
    "#e6e9ef" "#dce0e8"
  )

  local mocha_colors=(
    "#f5e0dc" "#f2cdcd" "#f5c2e7" "#cba6f7" "#f38ba8" "#eba0ac"
    "#fab387" "#f9e2af" "#a6e3a1" "#94e2d5" "#89dceb" "#74c7ec"
    "#89b4fa" "#b4befe" "#cdd6f4" "#bac2de" "#a6adc8" "#9399b2"
    "#7f849c" "#6c7086" "#585b70" "#45475a" "#313244" "#1e1e2e"
    "#181825" "#11111b"
  )

  local flavors=("macchiato" "frappe" "latte" "mocha")
  local flavor_colors=("macchiato_colors[@]" "frappe_colors[@]" "latte_colors[@]" "mocha_colors[@]")


  if [[ -n "$1" ]]; then
    local found=false
    for (( j = 0; j < ${#flavors[@]}; j++ )); do
      for (( i = 0; i < ${#${(P)${flavor_colors[j]}}}; i++ )); do
        if [[ "$1" == "${flavors[j]}-$((i + 1))" ]]; then
          color=${(P)${flavor_colors[j]}[i]}
          echo -n "$color" | clip
          echo "Copied ${flavors[j]}-$((i + 1)): $color to clipboard."
          found=true
          break 2
        fi
      done
    done
    if ! $found; then
      echo "Color ID not found."
    fi
  else
  for (( i = 0; i < ${#macchiato_colors[@]}; i++ )); do
    for (( j = 0; j < ${#flavors[@]}; j++ )); do
      color=${(P)${flavor_colors[j]}[i]}
      r=$(echo $color | cut -c 2-3)
      g=$(echo $color | cut -c 4-5)
      b=$(echo $color | cut -c 6-7)
      printf "\033[48;2;$((16#$r));$((16#$g));$((16#$b))m  \033[0m %s-%02d %s  " ${flavors[j]} $((i + 1)) $color
    done
    echo ""
  done

  fi
}
