# dotfiles

To install:

```bash
git clone --bare https://github.com/bburhans/dotfiles.git "$HOME/dotfiles"
git --git-dir="$HOME"/dotfiles --work-tree="$HOME" config --local status.showUntrackedFiles no
git --git-dir="$HOME"/dotfiles --work-tree="$HOME" checkout
```

To use the `dotfiles` alias in `bash` to work with the repository, just source the new `.bashrc` or set [its alias](https://github.com/bburhans/dotfiles/blob/52d27dead859eec6fe3819bfd68d65c63400b54a/.bashrc#L16) by itself:

```bash
. ~/.bashrc
# or...
alias dotfiles='git --git-dir="$HOME"/dotfiles --work-tree="$HOME"'
```
