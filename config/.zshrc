# ***********************************************************************************************
#                                      THE EAGLE'S .ZSHRC
# ENVIRONMENT:     ARCH LINUX
#                  HYPRLAND
#
# REQUIREMENTS:    ZOXIDE, EZA, LAZYGIT
#                  ZSH-VI_MODE, NVIM
#                  FZF, FZF-TAB
#                  POWERLEVEL10K
#                  ZSH-SYNTAX-HIGHLIGHTING
#                  ZSH-AUTOSUGGESTIONS
# ***********************************************************************************************

# ===============================================================================================
# POWERLEVEL10K
# ===============================================================================================
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===============================================================================================
# HISTORY CONFIGURATION
# ===============================================================================================

HISTFILE=~/.zsh_history          # location of the history file
HISTFILESIZE=50000               # history limit of the file on disk
HISTSIZE=50000                   # current session's history limit
SAVEHIST=50000                   # upon exit zsh saves X many lines from memory -> history
setopt EXTENDED_HISTORY          # Write the history file with timestamps
setopt INC_APPEND_HISTORY        # Write to the history file immediately.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt autocd                    # Type directory name to cd into it

setopt numericglobsort
setopt interactivecomments
setopt nonomatch

PROMPT_EOL_MARK=""                                 # Hide '%' when output lacks newline
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'  # Better time command output

# ===============================================================================================
# COMPLETION SETTINGS
# ===============================================================================================

# Faster completion loading ⚡
autoload -Uz compinit
# Ignore insecure directories
compinit -u

# Compile the completion dump to binary for even more speed
zcompdump="${ZDOTDIR:-$HOME/.zsh}/.zcompdump"
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
fi

# ===============================================================================================
# ENHANCED COMPLETION 
# ===============================================================================================
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ===============================================================================================
# ALIASES & BINDINGS
# ===============================================================================================

# EZA Command
alias l='eza -s=name --group-directories-first'                      # Shorthand ls
alias ls='eza -s=name --icons --group-directories-first'             # Show Files
alias ll='eza -l -s=name --icons --group-directories-first'          # List Files
alias la='eza -A -s=name --icons --group-directories-first'          # Show Hidden Files
alias lla='eza -la -s=name --icons --group-directories-first'        # List Hidden Files

alias lt='eza -s=name --tree --icons --group-directories-first'               # Show Tree
alias l2='eza -s=name --tree --icons --level=2 --group-directories-first'     # Show Tree LVL 2

# Miscellaneous
alias lg='lazygit'                                                            # Lazygit Shorthand
alias dwd="aria2c -x 16 -s 16 --continue=true --retry-wait=2 --max-tries=0"   # Aria2c Download
alias dbc="gcc -g3 -O0 -o .out "                                              # Debug C
alias dbx="g++ -std=c++20 -g3 -O0 -o .out "                                   # Debug C++

# ===============================================================================================
# ZSH PLUGINS
# ===============================================================================================

# ZSH-SYNTAX-HIGHLIGHTING: Syntax highlighting for commands
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ZSH-AUTOSUGGESTIONS: Autosuggestions based on command history
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'  # Light gray suggestions
fi

# ZOXIDE: Smart directory jumping
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# FZF: Key bindings and completion
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

# FZF: Auto Tab Completion
if [ -f /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ]; then
    source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

    # 1. Preview directory tree when tabbing after 'cd'
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'
    # 2. Preview file contents (code) when tabbing after 'nvim', 'cat', or 'bat'
    zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --style=numbers --line-range \
            :500 $realpath 2>/dev/null || eza -1 --icons --color=always $realpath 2>/dev/null'
    # 3. Switch the UI to a cleaner look with rounded borders
    zstyle ':fzf-tab:*' fzf-flags --height=50% --border=rounded --layout=reverse \
            --color=header:italic
fi

# ZSH VI Mode Plugin
if [ -f /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]; then
    source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh # Source Plugin

    ZVM_CURSOR_STYLE_ENABLED=true # Cursor shape changes between modes
    ZVM_SYSTEM_CLIPBOARD_ENABLED=true # Use system clipboard with y/p
    ZVM_CLIPBOARD_COPY_CMD='wl-copy'
    ZVM_CLIPBOARD_PASTE_CMD='wl-paste'

    ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
fi

# ===============================================================================================
# ENVIRONMENT VARIABLES
# ===============================================================================================

export MOZ_ENABLE_WAYLAND=1                      # The most important flag for Zen!
export MOZ_DBUS_REMOTE=1                         # Improves IPC communication
export MOZ_DISABLE_RDD_SANDBOX=1                 # Helps NVIDIA hardware decoding
export EGL_PLATFORM=wayland                      # Forces the correct rendering backend
export EDITOR=nvim                               # Default Editor

# ===============================================================================================
# END OF .ZSHRC
# ===============================================================================================
