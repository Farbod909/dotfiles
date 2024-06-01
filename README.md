# Instructions
Instructions assume you are starting from a fresh mac. If not, jump to correct step.

Install homebrew.
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install Alacritty (terminal).
```zsh
brew install --cask alacritty
```
Tip: you may have to go to Settings > Privacy & Security and click on "Open anyway".

Install git.
```zsh
brew install git
```

Install oh-my-zsh.
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Set config dotfiles from this repo to the current machine.
NOTE: This will overwrite any existing config if there is one. Make sure you have a backup of `.zshrc`, `.oh-my-zsh/` and `.config/` if you would like to keep your existing config as well.
```zsh
./set-config.command
```

Install necessary font.
```zsh
brew install font-meslo-lg-nerd-font
```

Nice to have.
```zsh
brew install zsh-autosuggestions
```

## Making changes

If you would like to update the config in this local repo based on changes made to the config on your computer, you can run the `update-config` script.
```zsh
./update-config.command
```
