# Launch the ide Zellij layout (yazi 2/3 | pi 1/3) in the current or given directory.
# The layout's tab cwd and name are rendered for each invocation.
unalias ide 2>/dev/null

ide() {
  emulate -L zsh
  local dir="${1:-$PWD}"
  dir="${dir:A}"
  local name="${dir:t}"

  local tmp="${TMPDIR:-/tmp}/ide-$$.kdl"
  sed -e "s|__IDE_DIR__|$dir|" -e "s|__IDE_NAME__|$name|" \
    "$HOME/.config/zellij/layouts/ide.kdl" > "$tmp" || return 1

  if [[ -n $ZELLIJ ]]; then
    zellij action new-tab --layout "$tmp" --cwd "$dir"
    rm -f "$tmp"
    return
  fi

  local line
  line=$(zellij list-sessions -n 2>/dev/null | awk -v n="$name" '$1 == n {print; exit}')
  if [[ -n $line ]]; then
    if [[ $line != *"(EXITED"* ]]; then
      rm -f "$tmp"
      ( cd "$dir" && exec zellij attach "$name" )
      return
    fi
    zellij delete-session "$name" >/dev/null 2>&1
  fi

  local final="$name" i=2
  while zellij list-sessions -n 2>/dev/null | awk '{print $1}' | grep -qx "$final"; do
    final="$name-$i"
    (( i++ ))
  done

  ( cd "$dir" && exec zellij -n "$tmp" -s "$final" )
  rm -f "$tmp"
}
