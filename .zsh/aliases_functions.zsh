ls() {
    local args="$@"
    if [[ "$args" == *"-l"* ]]; then
        eza --long "$@"
    else
        eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions "$@"
    fi
}

colorp() {
  confirm="y"
  colors=()

  while [ "$confirm" = "y" ]; do
    # Perform the task (you can replace this with your actual task)
    color=$(grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt: | awk 'NR==2 {print $3}')
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

dev() {
  if [[ $# -ne 1 && $# -ne 2 ]] ; then
    devError || return
  fi
  # make all echo BLUE
  echo -e "\e[34m"

  case $1 in
    -cpp)
      echo "Dev - C++"
      cd ~/Workstation/Personnel/dev/cpp
      ;;
    *)
      echo "Invalid option: $1"
      devError
      ;;
  esac

}

devError() {
  echo "\e[31m
Usage: dev < -cpp >"
  return 1
}

## EPSIC
epsic() {
  # Ensure one and only one option is provided
  if [[ $# -ne 1 && $# -ne 2 ]] ; then
    epsicError || return
  fi
  # make all echo BLUE
  echo -e "\e[34m"

  case $1 in
    -122)
      echo "i122 - Scripts"
      epsic122 $2
      ;;

    -117)
      echo "i117 - Infra"
      cd ~/Workstation/EPSIC/117
      ;;

    -164)
      echo "i164 - Python flask"
      if [[ $2 = "run" ]]; then
        start164app
      elif [[ $# -gt 1 ]]; then
        echo "Invalid argument"
        epsicError || return
      else
        cd ~/Workstation/EPSIC/164
      fi
      ;;

    -319)
      if [[ $# -gt 1 ]]; then
        echo "Invalid argument"
        epsicError || return
      fi
      echo "i319 - Java"
      cd ~/Workstation/EPSIC/319
      ;;
    *)
      echo "Invalid option: $1"
      epsicError
      ;;
  esac
}

epsicError() {
  echo "\e[31m
Usage: epsic < -122 [ps, py, sh] | -164 optional[run] | -319>"
  return 1
}

epsic122(){
  case $1 in
    ps)
      echo "Powershell (root of 122)"
      cd ~/Workstation/EPSIC/122
      ;;
    py)
      echo "Python"
      cd ~/Workstation/EPSIC/122/python
      ;;
    sh)
      echo "Bash"
      cd ~/Workstation/EPSIC/122/bash
      ;;
    *)
      echo "Invalid option: $1"
      epsicError
      ;;
  esac
}

start164app() {

  echo -e "\e[34m
Starting app ...
\e[0m"
  systemctl start docker.socket
  # all echo BLUE
  echo -e "\e[34m
INFO: Starting phpmyadmin container ...
"
  cd ~/Workstation/Docker/docker_sql_phpmyadmin
  sudo docker compose up -d

  echo -e "\e[34m
INFO: Starting python env ...
"
  cd ~/Workstation/EPSIC/164/164_films_om
  source .venv/bin/activate

  echo -e "\e[34m
INFO: Starting application ...
\e[0m"
  python run_mon_app.py
}

rewa(){
  echo "don't forget to delete this term"
  killall waybar
  cd /home/ovsiankina/.config/hypr
  ./autostart
}
