if command -v vim >/dev/null 2&>1 ; then
  mkdir -p $HOME/.vim/pack/local/start
  cd $HOME/.vim/pack/local/start
  git clone https://github.com/editorconfig/editorconfig-vim.git
fi
