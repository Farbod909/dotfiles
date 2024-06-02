# Instructions
Instructions assume you are starting from a fresh mac. If not, jump to correct step.

Open a terminal window.

Install [homebrew](https://brew.sh/).
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Tip: Once installation is complete, follow "Next Steps:" that are displayed in the terminal to add homebrew to your PATH.

While homebrew is being installed, modify the following MacOS settings in the System Settings app.
```
(necessary)
Desktop & Dock > Turn off "Automatically rearrange Spaces based on most recent use"
Desktop & Dock > Turn on "Displays have separate spaces"
Desktop & Dock > Turn on "Automatically hide and show the Dock"

(optional) 
Desktop & Dock > Set "Position on screen" to "Left"
Desktop & Dock > Turn off "Show suggested and recent apps in Dock"
Desktop & Dock > Untick "Show items" "On Desktop"
Desktop & Dock > Set "Click wallpaper to reveal desktop" to "Only in Stage Manager"
Desktop & Dock > Untick "Show widgets" "On Desktop", and "In Stage Manager"
Desktop & Dock > Set "Default web browser" to Chrome
Keyboard > Set "Key repeat rate" to fastest
Keyboard > Set "Delay until repeat" to as short as possible
Mouse > Set "Tracking speed" to "Slow + 3"
Mouse > Set "Scrolling speed" to "Slow + 3"
Trackpad > Set "Tracking speed" to "Slow + 4"
```

Install [Alacritty](https://github.com/alacritty/alacritty) (terminal).
```zsh
brew install --cask alacritty
```

Open Alacritty.
Tip: you may have to go to Settings > Privacy & Security and click on "Open anyway".

Once Alacritty is installed, you may close your default terminal app and open Alacritty instead.

Perform the following installations in order:
```zsh
# Install git
brew install git

# Install oh-my-zsh (https://ohmyz.sh/)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Amethyst (https://github.com/ianyh/Amethyst)
brew install --cask amethyst
# Launch Amethyst from the Applications folder.
# Tip: Amethyst must be given permissions to use the accessibility APIs in the Privacy & Security tab, Privacy -> Accessibilty.

# Install JankyBorders (https://github.com/FelixKratz/JankyBorders)
brew tap FelixKratz/formulae
brew install borders 

# Install a font that supports special characters
brew install font-meslo-lg-nerd-font

# Nice to have stuff
brew install eza
brew install zsh-autosuggestions
```

Once everything has been installed, clone this repo.
```zsh
git clone https://github.com/Farbod909/dotfiles.git
cd dotfiles
```

Set config dotfiles from this repo to the current machine.
NOTE: This will overwrite any existing config if there is one. Make sure you have a backup of `.zshrc`, `.oh-my-zsh/` and `.config/` if you would like to keep your existing config as well.
```zsh
./set-config.command
```
At this point to see all your changes applied:
- Run `source .zshrc`
- Quit Alacritty and re-open.
- Relaunch Amethyst and watch it tile your windows.
- Start JankyBorders with `brew services start borders`.

## Other necessary apps
- [BetterTouchTool](https://folivora.ai/)
	- Open the app and import `Default.bttpreset` from the root of this repo.
	- You should be able to find this in the upper right corner of the BTT UI.
- [Scroll Reverser](https://pilotmoon.com/scrollreverser/)
	- Check "Reverse Vertical"
	- Uncheck "Reverse Horizontal"
	- Uncheck "Reverse Trackpad"
	- Check "Reverse Mouse"

## Making changes

If you would like to update the config in this local repo based on changes made to the config on your computer, you can run the `update-config` script.
```zsh
./update-config.command

# Then, make a commit / pull request.
```

# Login items
I recommend setting the following apps to run on startup.
- Amethyst
- BetterTouchTool
- Scroll Reverser
