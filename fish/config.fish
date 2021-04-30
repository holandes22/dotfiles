function unset
  set --erase $argv
end

set -gx EDITOR vim
set -gx ERL_AFLAGS "-kernel shell_history enabled"


starship init fish | source
direnv hook fish | source
source /usr/local/opt/asdf/asdf.fish
