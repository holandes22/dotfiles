function unset
  set --erase $argv
end

set -gx EDITOR vim
set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx PIP_REQUIRE_VIRTUALENV true
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
fish_add_path ~/.local/bin


starship init fish | source
direnv hook fish | source
source /opt/homebrew/opt/asdf/asdf.fish

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/pablo/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

