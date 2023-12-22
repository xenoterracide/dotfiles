# WARNING: this file was generated from {{ yadm.source }}
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

zi wait atload'. ~/.asdf/plugins/java/set-java-home.zsh' for z-shell/null

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

setopt GLOBDOTS
set -o emacs
bindkey "^R" history-search-multi-word
