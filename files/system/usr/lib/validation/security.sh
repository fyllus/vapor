
string_hash () {
    local string="$1"
    echo "$string" | md5sum | tr -d "-"
}
