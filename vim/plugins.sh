if [ ! -f ~/.vim/autoload/pathogen.vim ]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

plugins=('https://github.com/tpope/vim-rails.git' \
    'https://github.com/tpope/vim-dispatch.git' \
    'https://github.com/vim-syntastic/syntastic.git' \
    'https://github.com/christoomey/vim-tmux-navigator.git'\
    'https://github.com/airblade/vim-gitgutter.git')
old_dir=$(pwd)
cd ~/.vim/bundle/

for plugin in ${plugins[*]}
  do
    git clone $plugin $plugin 2> /dev/null  
    #TODO Add a git pull when repo already cloned
done

cd $old_dir

