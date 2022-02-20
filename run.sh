# Usage
if [ $# -ne 2 ]; then
 echo "Usage: $0 [user_name] [user_email]"
 echo "Your input user_name and user_email will be used for git configuration and ssh key generation."
 exit -1
fi

user_name=$1
user_email=$2

# Install Homebrew.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install terminal utilities.
## oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## zsh-syntax-highlighting, zsh-autosuggestions
brew install zsh-syntax-highlighting
brew reinstall zsh-autosuggestions

# Activate command line VSCode opening.
cp -r /Applications/Visual\ Studio\ Code.app ~/Applications/Visual\ Studio\ Code.app

# Set git core editor to VSCode.
git config --global core.editor \"code --wait\"

# Setup git global config.
git config --global user.name \"$user_name\"
git config --global user.email \"$user_email\"

# Generate ssh key.
ssh-keygen -t ed25519 -C \"$user_email\"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519

# Setup zsh configuration.
cat << EOF >> ~/.zshrc
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
EOF

cp robbyrussell.zsh-theme ~/.oh-my-zsh/themes/robbyrussell.zsh-theme
