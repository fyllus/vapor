
is_caller_root() {
    [[ "$EUID" -ne 0 ]] && return 0 || return 1
}

user_exists() {
    id "$1" &>/dev/null && return 0 || return 1
}

try_change_owner_ok() {
    local UID="$(id -u "$1")"
    local GID="$(id -g "$1")"


    chown -R "$UID:$GID" "$DIR" &> /dev/null && return 0 || return 1
}
