time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
if command -v tmux>/dev/null; then
    [ -z $TMUX ] && exec tmux a
else 
    echo "tmux not installed. Run ./deploy to configure dependencies"
fi

## Pull latest changes from repo and apply.
#echo -e "Checking for updates....\n"
#{ ({cd ~/dotfiles && git fetch -q} &> /dev/null) } 
#if [ $({cd ~/dotfiles} &> /dev/null && git rev-list HEAD...origin/master | wc -l) = 0 ]
#then
#   echo "Already up to date."
#else
#   echo "Updates Detected:"
#   ({cd ~/dotfiles} &> /dev/null && git log ..@{u} --pretty=format:%Cred%aN:%Creset\ %s\ %Cgreen%cd)
#   echo "Setting up..."
#   ({cd ~/dotfiles} &> /dev/null && git pull -q && git submodule update --init --recursive)
#fi
#
# Ensure all vim plugins are cloned into bundle
echo -e "Ensuring vim plugins are cloned into bundle..."
source ~/dotfiles/vim/plugins.sh


echo -e "Loading Configs..."
source ~/dotfiles/zsh/zshrc.sh
source ~/dotfiles/zsh/aliases.sh

clear

