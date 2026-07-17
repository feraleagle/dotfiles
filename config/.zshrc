# ============================================================
# THE EAGLE'S HYBRID .ZSHRC FOR ARCH LINUX
# ============================================================

# ============================================================
# POWERLEVEL10K INSTANT PROMPT
# ============================================================
# Instant prompt for faster startup; requires console input above this block
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================
# POWERLEVEL10K THEME
# ============================================================
# Core theme file
source ~/.local/share/powerlevel10k/powerlevel10k.zsh-theme

# ============================================================
# HISTORY CONFIGURATION
# ============================================================

HISTFILE=~/.zsh_history          # location of the history file
HISTFILESIZE=50000               # history limit of the file on disk
HISTSIZE=50000                   # current session's history limit
SAVEHIST=50000                   # zsh saves this many lines from the in-memory history list to the history file upon shell exit
unsetopt EXTENDED_HISTORY        # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don\'t record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don\'t record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don\'t write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt autocd                    # Type directory name to cd into it

PROMPT_EOL_MARK=""                                 # Hide '%' when output lacks newline
TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'  # Better time command output

# ============================================================
# COMPLETION SETTINGS
# ============================================================
# Faster completion loading ⚡
autoload -Uz compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Ignore insecure directories (important if you’re using Arch + Hyprland + powerlevel10k)
zstyle ':completion:*' rehash true
compinit -u

# Compile the completion dump to binary for even more speed
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
fi

# ============================================================
# ENHANCED COMPLETION 
# ============================================================
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ============================================================
# KEYBINDINGS 
# ============================================================
bindkey -e                                        # VI Key Bindings
bindkey '^[OP' autosuggest-accept                 # Accept AUTOSUGGESTION  [F1]
bindkey '^[OQ' autosuggest-execute                # Execute AUTOSUGGESTION [F2]

# ============================================================
# ALIASES & SHORTCUTS
# ============================================================
# EZA Command
alias ls='eza --icons --color=always --group-directories-first'             # show files
alias la='eza -A --icons --color=always --group-directories-first'          # show hidden files
alias ll='eza -l --icons --color=always --group-directories-first'          # list files
alias lla='eza -la --icons --color=always --group-directories-first'        # list hidden files
alias ld='eza -ld .*'                                                       # show dotfiles only

alias lt='eza --tree --icons --color=always --group-directories-first'                 # show tree
alias lt2='eza --tree --icons --level=2 --color=always --group-directories-first'      # show tree 2 levels deep


alias ltc='eza --tree --icons=never --color=never | wl-copy'
alias lc='/bin/ls -l --group-directories-first | wl-copy'
alias lca='/bin/ls -la --group-directories-first | wl-copy'

# CD Command
alias ..='cd ..'
alias ...='cd ../..'

# Miscellaneous
alias lg='lazygit'                                                                 # lazygit shorthand
alias runtr='systemctl start trilium-next-server.service'                          # Start Trilium Notes Server Instance
alias stoptr='systemctl stop trilium-next-server.service'                          # Stop Trilium Notes Server Instance   
alias dwld="aria2c -x 16 -s 16 --continue=true --retry-wait=2 --max-tries=0"       # Downloading shortcut using aria2c

# Compile & Execute main.cpp File
cpprun() {
    # Default settings
    local file="main.cpp"
    local debug=0

    # Parse arguments
    for arg in "$@"; do
        if [[ "$arg" == "--debug" ]]; then
            debug=1
        else
            file="$arg"
        fi
    done

    local out="${file%.*}.out"

    # Colors
    GREEN='\033[0;32m'
    CYAN='\033[0;36m'
    RED='\033[0;31m'
    NC='\033[0m'

    if [[ $debug -eq 1 ]]; then
        # Debug compile
        if g++ -std=c++20 -Wall -Wextra -O0 -g "$file" -o "$out"; then
            echo -e "${GREEN}✅ Compilation successful (debug). Debugging $out...${NC}"
        else
            echo -e "${RED}❌ Compilation failed.${NC}"
        fi
    else
        # Release compile
        if g++ -std=c++20 -Wall -Wextra -O2 "$file" -o "$out"; then
            echo -e "${GREEN}✅ Compilation successful. Running $out...${NC}"
            ./"$out"
        else
            echo -e "${RED}❌ Compilation failed.${NC}"
        fi
    fi
}

# The "Cheat Sheet" via `curl`
cheat() { curl -s cheat.sh/"$*" }

# ============================================================
# ZSH PLUGINS
# ============================================================
# Syntax highlighting for commands
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Autosuggestions based on command history
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'  # Light gray suggestions
fi

# FZF key bindings and completion
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

# Smart directory jumping
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
fi

# FZF Auto Tab Completion
if [ -f /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh ]; then
    source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

    # 1. Preview directory tree when tabbing after 'cd'
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons --color=always $realpath'
    # 2. Preview file contents (code) when tabbing after 'nvim', 'cat', or 'bat'
    zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --style=numbers --line-range :500 $realpath 2>/dev/null || eza -1 --icons --color=always $realpath 2>/dev/null'
    # 3. Switch the UI to a cleaner look with rounded borders
    zstyle ':fzf-tab:*' fzf-flags --height=50% --border=rounded --layout=reverse --color=header:italic
fi

# ============================================================
# EVALUATIONS & EXECUTIONS
# ============================================================
eval $(thefuck --alias) # The Fuck

# ============================================================
# ENVIRONMENT VARIABLES
# ============================================================
export EDITOR=nvim

# ============================================================
# BROWSER & GUI OPTIMIZATIONS
# ============================================================
export MOZ_ENABLE_WAYLAND=1                      # The most important flag for Zen!
export MOZ_DBUS_REMOTE=1                         # Improves IPC communication
export MOZ_DISABLE_RDD_SANDBOX=1                 # Helps NVIDIA hardware decoding
export EGL_PLATFORM=wayland                      # Forces the correct rendering backend

# ============================================================
# POWERLEVEL10K CONFIGURATION
# ============================================================
# Load user-specific Powerlevel10k settings if available
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Smart Sorting and Comments
setopt numericglobsort
setopt interactivecomments
setopt nonomatch

# ============================================================
# END OF .ZSHRC
# ============================================================
