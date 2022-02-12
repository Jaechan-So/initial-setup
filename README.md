# initial-setup

## Requirements

* [iTerm2](https://iterm2.com/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Karabiner-Elements](https://karabiner-elements.pqrs.org/)

## Setup

1. Configure initial settings by running shell script.

```bash
chmod 764 ./run.sh
./run.sh [user_name] [user_email]
```

2. Add karabiner setting (`karabiner_complex_modification.json`) in `~/.config/karabiner/karabiner.json`. It should be added in `profiles.complex_modifications.rules`.
