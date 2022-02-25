# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# We dont need update
zstyle ':omz:update' mode disabled  # disable automatic updates

# ZSH plugins
plugins=(git tmux tmuxinator macos github brew rustup zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
# Functions

## Function that convert mov into gif with 1028px width
function movtogif () {
  tempfile=.mov-to-gif-$(date +"%s").png
  ffmpeg -i $1 -vf "scale=1028:-2" "${1%.mov}-resized.mov"
  ffmpeg -stats -y -i "${1%.mov}-resized.mov" -vf fps=10,palettegen $tempfile
  ffmpeg -stats -i "${1%.mov}-resized.mov" -i $tempfile -filter_complex "fps=10,paletteuse" "${1%.mov}.gif"
  rm $tempfile "${1%.mov}-resized.mov"
}

## Function that running task in background
function silent_background() {
    { 2>&3 "$@"& } 3>&2 2>/dev/null
    disown &>/dev/null  # Prevent whine if job has already completed
}

## Function that checking current env
function run_if_arm() {
  BREW_PATH=$(which brew)
  if [[ $BREW_PATH == "/opt/homebrew/bin/brew" ]]; then
    "$@"
  fi
}
function run_if_x86() {
  BREW_PATH=$(which brew)
  if [[ $BREW_PATH == "/usr/local/homebrew/bin/brew" ]]; then
    "$@"
  fi
}

## Change ENV into x86 environment
function 86env {
  rosetta -i
}
## Change ENV into ARM environment (default)
function armenv {
  rosetta -a
}

## Backup and restore global node packages (require PNPM)
bak_node_global () {
  npm list --global --parseable -depth=0 | sed '1d' | awk 'BEGIN{FS="/"} {print $NF}' | awk 'BEGIN{FS="@"} {print $1}' > .config/node_global.txt
}

res_node_global () {
  xargs pnpm install --global < .config/node_global.txt
}


# Node manager
eval "$(fnm env --use-on-cd)"

# Android ENV
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/22.1.7171670

# Flutter SDK
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:/Users/saintno/Applications/flutter/bin"
export CHROME_EXECUTABLE="/Applications/Opera GX.app/Contents/MacOS/Opera"

# RUST Setup
export PATH="$PATH":"$HOME/.cargo/bin"
export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"

# Switching ENV
ENV_FLAG="$(uname -m)"
if [[ $ENV_FLAG == "arm64" ]]; then
  # Sepecific for ARM ENV
  run_if_x86 silent_background rustup default stable-aarch64-apple-darwin &>/dev/null
  alias brew="/opt/homebrew/bin/brew"
  export LIBRARY_PATH=/usr/lib:/opt/homebrew/lib
  export OPENSSL_DIR=/opt/homebrew/opt/openssl@3
  export RUSTFLAGS='-L /usr/local/Homebrew/lib'
  export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="[ARM64 ⚡] "
else
  # Sepecific for X86 ENV
  run_if_arm silent_background rustup default stable-x86_64-apple-darwin &>/dev/null
  alias brew="/usr/local/homebrew/bin/brew"
  export LIBRARY_PATH=/usr/lib:/usr/local/Homebrew/lib
  export OPENSSL_DIR=/usr/local/homebrew/opt/openssl@3
  export RUSTFLAGS='-L /usr/local/Homebrew/lib'
  export TYPEWRITTEN_RIGHT_PROMPT_PREFIX="[X86 🐢] "
fi

# Fetch sys info
clear
pfetch
fpath=($fpath "/Users/saintno/.zfunctions")


# Set typewritten ZSH as a prompt
export TYPEWRITTEN_PROMPT_LAYOUT="multiline"
autoload -U promptinit; promptinit
prompt typewritten


# Make this world more better 🌎
alias npm="pnpm"
alias v="nvim"
alias vzsh="nvim ~/.zshrc"
bindkey '^a' autosuggest-accept

