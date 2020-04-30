if command -v vim >/dev/null 2&>1 ; then
  mkdir -p ~/.vim/pack/local/start
  cd ~/.vim/pack/local/start
  git clone https://github.com/editorconfig/editorconfig-vim.git
fi
