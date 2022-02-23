{% include "../extra/env.sh" %}
{% if yadm.class %}}
{% include "../extra/{{ yadm.class }}.zsh" %}
{% endif %}

if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  sh -c "$(curl -fsSL https://git.io/get-zi)" -- -i skip -b v1.0.0
fi

zi_home="${HOME}/.zi"
source "${zi_home}/bin/zi.zsh"
# Next two lines must be below the above two
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi ice lucid id-as
zi load z-shell/z-a-patch-dl

zi ice lucid as"program" pick"cmds/zc-bg-notify"
zi load z-shell/zconvey
