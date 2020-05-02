# Kali Settings

#### XFCE4 Panel Preferences

> XFCE4-Panel Settings are stored at /home/dent0n/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
- Remove *Battery* status icon from the panel (Items section)
- Remove *Workspace* Switcher from the panel (Items section)
- Remove *Show Desktop* icon from the panel (Items section)
- Remove unnecesary *Separators* (Items section)
- Add *Launcher* for Firefox ESR
  - In the General tab select the Firefox ESR application
- Clock settings
  - Custom Format 
  - > %R
- Window Buttons settings
  - Middle click action -> Close window
- Action buttons
  - Disable Lock Screen

#### VPN Status Indicator in XFCE4 Panel

- Add the Generic Monitor item to the XFCE4 Panel
  - The command should be
  > ./vpn_indicator.sh
  - Disable the *Label* checkbox and set the interval to 1 second
  - Add the **vpn_indicator.sh** script and VPN icons to /home/{user}

#### Terminal Emulator Settings

- Appearence
  - Disable *Show the menu bar*
    - Menu bar and preferences can be accessed via right click on the terminal background
  - Set *Application transparency* to 0%
  - Set *Terminal transparency* to 0%
- Behavior
  - Enable *Unlimited history*
  - Enable *Trim trailing newlines in pasted text*

#### ZSH Installation and Configuration

- The steps below have to be done for both the normal and root users!
- Install ZSH shell if not already present
> sudo apt install zsh
- Install Oh-My-Zsh
  - Select *Yes* when asked to change default shell to zsh
    - Might need to restart in order for the changes to apply
    > sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
- Install and configure Powerlevel10k
  - Download the fonts: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
  - Copy them to /usr/share/fonts/
  - Install Powerlevel10k: https://github.com/romkatv/powerlevel10k#oh-my-zsh
  - Follow the configuration prompts to configure it
  - Edit the file *.p10k.zhs* with the following changes
    - Comment out all the segments shown in the right
    - Add *context* to the segments shown in the left
    - In the section *[ context: user@hostname ]*, change *POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE* to:
    ```bash
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE=''
    typeset -g POWERLEVEL9K_CONTEXT_PREFIX=
    ```
    - In the section *[ os_icon: os identifier ]*, edit the uncomment and edit the followinf line:
    ```bash
      typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=''
      typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=000
      typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=208
    ```
    - In the section *[ dir: current directory ]*, edit the following lines:
    ```bash
    # Current directory background color.
    typeset -g POWERLEVEL9K_DIR_BACKGROUND=033
    # Default current directory foreground color.
    typeset -g POWERLEVEL9K_DIR_FOREGROUND=000
    # If directory is too long, shorten some of its segments to the shortest possible unique
    # prefix. The shortened directory can be tab-completed to the original.
    # Replace removed segment suffixes with this symbol.
    typeset -g POWERLEVEL9K_SHORTEN_DELIMITER='..'
    # Shorten to the last 2 directories
    typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    # Color of the shortened directory segments.
    typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=000
    # Color of the anchor directory segments. Anchor segments are never shortened. The first
    # segment is always an anchor.
    typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=004
    # Display anchor directory segments in bold.
    typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
    ```
  - Edit the file *.zshrc* and add the following functions:
  ```bash
  # Functions

  function mkt(){
    mkdir {nmap,loot,exploits}
  }
  ```
- Install *lsd* from https://github.com/Peltoche/lsd
  - Download the latest .deb from the releases page
  - Edit the file *.zshrc* and add the following alias:
  ```bash
  # Aliases

  alias ls='lsd'
  ```
- Install the plugin *zsh-syntax-highlighting* https://github.com/zsh-users/zsh-syntax-highlighting
  - Enable it in *.zshrc*
