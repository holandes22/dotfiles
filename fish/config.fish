function unset
  set --erase $argv
end

set -gx EDITOR vim
set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx PIP_REQUIRE_VIRTUALENV true
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

fish_add_path ~/.local/bin

fzf --fish | source

# Using the following alias as fzf recommends not putting preview in FZF_DEFAULT_OPTS
# See: https://github.com/junegunn/fzf?tab=readme-ov-file#preview-window
alias ff "fzf --preview 'bat --color=always {}' --walker-skip=.venv,.git"
alias uv-outdated "uv pip tree --outdated --depth 0 | grep '(latest'"


starship init fish | source
direnv hook fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

function rabotai_ssh
    aws ecs execute-command --profile mana-bio-rabotai --cluster rabotai-mana-bio-PROD-ecs --task $argv[1] --container rabotai-web --interactive --region eu-central-1 --command '/bin/sh'
end


