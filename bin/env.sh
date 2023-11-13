#!/bin/env bash
set -e
set -x
set -u

declare -A connections=(
    [home]="comet rashbam912 shavit912"
    [aqua]="aquasec"
)

active_connections=$(nmcli -t -f name c show --active)

function get_env() {
    for env in ${!connections[@]}; do
        for env_connection in ${connections[$env]}; do
            for c in ${active_connections}; do
                if [[ ${c,,} == $env_connection ]]; then
                    echo $env
                    return
                fi
            done
        done
    done
}

env=$(get_env)

declare -A settings_home
declare -A settings_aqua
declare -A settings_dflt
function set() {
    path=$1; shift
    key=$1; shift
    home_val=$1; shift
    aqua_val=$1; shift
    dflt_val=$1; shift
    settings_home["${path}:${key}"]=${home_val}
    settings_aqua["${path}:${key}"]=${aqua_val}
    settings_dflt["${path}:${key}"]=${dflt_val}
}

set "org.gnome.desktop.session" "idle-delay" 1200 300 300

for path_key in ${settings_home[@]}; do
    echo $path_key
done




