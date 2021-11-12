# /bin/bin

# This is only for mac rn, will update later to actually use on ubuntu
if ! command -v brew &> /dev/null; then
    echo "brew could not be found, installing"
    xcode-select --install
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
    exit
else
    echo "brew already installed"
fi

if ! command -v ansible &> /dev/null; then
    echo "ansible could not be found, installing"
    brew install ansible
else
    echo "ansible already installed"
fi

ansible-pull -U https://github.com/teddylear/ansible.git
