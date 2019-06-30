cd $HOME

sudo apt update
sudo apt-get update

echo "installing zsh"

sudo apt install zsh

echo "changing default shell to zsh"

sudo chsh -s /usr/bin/zsh root
sudo chsh -s /usr/bin/zsh $USER

echo "your default shell is now $SHELL"

echo "installing oh-my-zsh"

# Install oh-my-zsh via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "installing zsh-syntax-highlighting"

# Install zsh-syntax-highlighting (not via oh-my-zsh)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "installing zsh-autosuggestions"

# Install zsh-autosuggestions (not via oh-my-zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ${(q-)PWD}/zsh-autosuggestions/zsh-autosuggestion.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

echo "installing tmux"
sudo apt-get install tmux

echo "make vim look better"
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

echo "make tmux look better"
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
