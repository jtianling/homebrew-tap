# jtianling/homebrew-tap

Personal Homebrew tap for projects by [@jtianling](https://github.com/jtianling).

## Available formulae

### dual-yazi

Dual-pane file manager based on [yazi](https://github.com/sxyazi/yazi).

```sh
brew install jtianling/tap/dual-yazi
```

Or tap first, then install:

```sh
brew tap jtianling/tap
brew install dual-yazi
```

Note: `dual-yazi` installs the same `yazi` and `ya` binaries as upstream yazi
and conflicts with `homebrew-core/yazi`. Uninstall the official one first if
already installed:

```sh
brew uninstall yazi
brew install jtianling/tap/dual-yazi
```

## Updating

```sh
brew update
brew upgrade dual-yazi
```

## Uninstall

```sh
brew uninstall dual-yazi
brew untap jtianling/tap
```
