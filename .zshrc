# プロンプトのハック
setopt always_last_prompt   # 補完の時にプロンプトの位置を変えない
setopt prompt_subst         # PROMPT 変数を処理する際にに変数展開を有効する

# ディレクトリ移動 / ディレクトリスタックの自動補完
# ref: http://qiita.com/yoshikaw/items/e12e239afdbaaec78ec7
DIRSTACKSIZE=100
setopt autopushd            # ディレクトリ移動のたびに勝手にスタックに積む
setopt pushd_silent         # スタックに積むときにメッセージを出さない
setopt pushd_ignore_dups    # 同じディレクトリはスタックに追加しない
setopt pushd_to_home        # ホームディレクトリはいつでもスタックに積む
setopt auto_cd              # ディレクトリと解釈できる文字列であれば cd してくれる
cdpath=(.. ~ ~/dev)         # 親ディレクトリ、ホームディレクトリ、~/dev 直下は auto_cd の対象となる

zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

setopt ignore_eof 
setopt extended_glob
setopt numeric_glob_sort
setopt auto_menu
setopt correct              # オートコレクト (exot を exit になおしてくれる)
setopt auto_remove_slash
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt list_types
setopt no_beep
setopt cdable_vars
setopt sh_word_split
setopt auto_param_keys
unsetopt promptcr
setopt completeinword

autoload -Uz compinit && compinit

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

### prompts
autoload -Uz colors; colors
case ${UID} in
0)
    PROMPT=$(print "%B%{\e[32m%}%m:%(5~,%-2~/.../%2~,%~)%{\e[31m%} %# %b")
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT=$(print "%B%{\e[32m%}%m:%(5~,%-2~/.../%2~,%~)%{\e[33m%} %# %b")
    SPROMPT="%{${fg_bold[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    ;;
esac

zmodload zsh/complist
export ZLS_COLORS=':no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:'
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# set aliases
case "$OSTYPE" in
  darwin*|freebsd*)
    alias ls='ls -GwF '
    alias ll='ls -law '
    alias la='ls -aw '
    ;;
  linux*)
    alias ls='ls --color'
    alias ll='ls -la --color '
    alias la='ls -a --color '
    ;;
esac


alias eng='LANG=C LANGUAGE=C LC_ALL=C'
alias -g lG='| grep '

# powered by mashiro
alias -g L="| less"
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g XG="| xargs grep"
alias -g V="| vim -R -"

# fool ploof
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

bindkey -e


# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# auto complete
setopt correct

# display pack
setopt list_packed

# VCS (Gitのブランチを出したり)
autoload -Uz is-at-least
if is-at-least 4.3.7; then
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git svn hg bzr
    zstyle ':vcs_info:*' formats '%s@%b'
    zstyle ':vcs_info:*' actionformats '%s@%b|%a'
    zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
    zstyle ':vcs_info:bzr:*' use-simple true

    if is-at-least 4.3.10; then
        zstyle ':vcs_info:git:*' check-for-changes true
        zstyle ':vcs_info:git:*' stagedstr "+"
        zstyle ':vcs_info:git:*' unstagedstr "-"
        zstyle ':vcs_info:git:*' formats '%s@%b %c%u'
        zstyle ':vcs_info:git:*' actionformats '%s@%b|%a %c%u'
    fi

    autoload add-zsh-hook
    function _update_vcs_info_msg() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd _update_vcs_info_msg
    RPROMPT="%0(v|%F%{${fg[cyan]}%}%1v%f|)"
fi

# RVM (Ruby Version Manager)
# ref: https://rvm.io/integration/zsh
setopt nullglob
unsetopt auto_name_dirs

# MacVim
alias macvim="mvim --remote-tab-silent"
