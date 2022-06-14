if status is-interactive
    #####################
    # FISH CONFIGURATION
    #####################
    set -x VIRTUAL_ENV_DISABLE_PROMPT 1
    set -g theme_display_time yes
    set -g theme_display_rw no
    set -g theme_display_group no
    set -g theme_display_jobs no

    ## THEME
    set theme_primary                                   436FF6
    set theme_secondary                                 ffcf44
    set theme_primary_variant                           FCD535
    set theme_secondary_variant                         ff6859
    set theme_hilight                                   b15dff

    set -g theme_color_user                             $theme_hilight
    set -g theme_color_host                             $theme_primary_variant
    set -g theme_color_separator                        brblack
    set -g theme_color_normal                           normal
    set -g theme_color_time                             cyan
    set -g theme_color_path                             $theme_primary
    set -g theme_color_prompt                           $theme_secondary_variant
    set -g theme_color_virtualenv                       $theme_secondary
    set -g theme_color_status_prefix                    $theme_hilight
    set -g theme_color_status_jobs                      $theme_primary
    set -g theme_color_status_rw                        $theme_primary
    set -g theme_display_group                          no
    set -g theme_prompt_segment_separator_color         $theme_primary
    set -g theme_prompt_userhost_separator              '.'
    set -g __fish_git_prompt_char_branch_begin          '['
    set -g __fish_git_prompt_char_branch_end            ']'
    set -g __fish_git_prompt_color_branch_begin         brblack
    set -g __fish_git_prompt_color_branch_end           brblack
    set -g __fish_git_prompt_color_branch               $theme_secondary

    set -gx fish_prompt_pwd_dir_length                  1
    set -g theme_display_jobs_always                    yes

    #####################
    # ALIAS NEEDED TOOLS
    #####################

    alias v="nvim"
    alias k="kubectl"
    alias vvim="nvim ~/.config/nvim"
    alias vfish="nvim ~/.config/omf"
    alias dockerd="colima"

    # EXPORT ENV
    set -x APPLICATIONS /Users/saintno/Applications
    set -gx EDITOR nvim

    ## Android development
    set -x ANDROID_HOME $HOME/Library/Android/sdk
    fish_add_path $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/ndk/22.1.7171670

    ## Flutter development
    set -gx CHROME_EXECUTABLE "/Applications/Opera GX.app/Contents/MacOS/Opera"
    fish_add_path $HOME/.pub-cache/bin $APPLICATIONS/flutter/bin

    ## Rust development
    fish_add_path $HOME/.cargo/bin

    ## Golang development
    set -gx GOPATH $HOME/go
    fish_add_path $GOPATH/bin

    ## Brew tools
    fish_add_path '/opt/homebrew/bin'


    #####################
    # TRIGGER FUNCTIONS
    #####################
    set -gx ENV_FLAG "$(uname -m)"

    if [ $ENV_FLAG = "arm64" ]
      command -q rustup default stable-aarch64-apple-darwin
      alias brew="/opt/homebrew/bin/brew"
      set -gx LIBRARY_PATH /usr/lib:/opt/homebrew/lib
      set -gx OPENSSL_DIR /opt/homebrew/opt/openssl@3
      set -gx RUSTFLAGS '-L /usr/local/Homebrew/lib'
      set -g theme_prompt_char_normal                    '[ARM64 ⚡] ❱'
      set -g theme_prompt_char_superuser                 '[ARM64 ⚡] #'
    else
      command -q rustup default stable-x86_64-apple-darwin
      alias brew="/usr/local/homebrew/bin/brew"
      set -gx LIBRARY_PATH /usr/lib:/usr/local/Homebrew/lib
      set -gx OPENSSL_DIR /usr/local/homebrew/opt/openssl@3
      set -gx RUSTFLAGS '-L /usr/local/Homebrew/lib'
      set -g theme_prompt_char_normal                    '[X86 🐢] ❱'
      set -g theme_prompt_char_superuser                 '[X86 🐢] #'
      fish_add_path '/usr/local/homebrew/bin'
    end

    eval "$(fnm env --use-on-cd)"

    #####################
    # FUNCTION DECLATION
    #####################

    ## Change ENV into x86 environment
    function 86env
      command rosetta -i /usr/local/homebrew/bin/fish
    end

    ## Change ENV into ARM environment (default)
    function armenv
      command rosetta -a /opt/homebrew/bin/fish
    end


    #####################
    # INITIALIZATION
    #####################
    command archey -l retro
end
