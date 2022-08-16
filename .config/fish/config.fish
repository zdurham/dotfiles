if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx TERM xterm-256color

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# for rust to be in the path
export PATH="$HOME/.cargo/bin:$PATH"

set -g fish_color_autosuggestion white


# Setting PATH for Python 3.10
# The original version is saved in /Users/zach/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.10/bin" "$PATH"

set -gx PNPM_HOME "/Users/zach/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
