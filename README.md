# Dotfiles
Dotfile set up using GNU stow. The directory stucture will go into the related files.
Stow will system link the folder to the location underneath. (e.g. `ghostty/.config/ghosty` will be system linked
to `~/.config/ghostty`)
```
~/
    ghostty/
        .config/
            ghostty
    nvim/
        .config/
            nvim
    tmux/
        .tmux.conf
    zsh/
        .zshrc
```

# Installing dotfiles
```bash
stow ghostty
stow nvim
stow tmux
stow zsh
```
