function get() {
  cd . && cd ~/Downloads
  curl --fail --silent --show-error --output $1 --time-cond $1 $2
  cd -
}

source <(curl -sL git.io/zi-loader); zzinit

{% include "../extra/zshrc.os.{{ yadm.os }},e.zsh" %}
zi for z-shell/z-a-meta-plugins z-shell/zconvey z-shell/H-S-MW

zi snippet OMZL::history.zsh

zi wait for \
  OMZL::theme-and-appearance.zsh atload"unalias ls" \
  OMZP::colored-man-pages \
  OMZP::systemd \
  OMZP::gitignore

{% include "../extra/rc.sh" %}
{% include "../extra/alias.zsh" %}

vim_setup
#######

if [[ -f ~/.asdf/plugins/java/set-java-home.zsh ]]; then
  source ~/.asdf/plugins/java/set-java-home.zsh
fi

zi ice wait has'java' as'program' pick'bin/mvn' extract'!apache-maven-3.9.5-bin.tar.gz'
zi snippet https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


zi for @romkatv

zstyle :plugin:history-search-multi-word reset-prompt-protect 1

schedprompt() {
  zle && zle reset-prompt
  sched +1 schedprompt
}

zmodload -i zsh/sched
schedprompt

zi wait for @zsh-users+fast

unfunction vim_setup
unfunction get

setopt GLOBDOTS
set -o emacs
bindkey "^R" history-search-multi-word
