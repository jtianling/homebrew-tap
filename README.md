# jtianling/homebrew-tap

Personal Homebrew tap for projects by [@jtianling](https://github.com/jtianling).

## Available formulae

AoE 是 jt 维护的 Agent of Empires 分支, 提供 macOS 和 Linux 的预编译二进制,
包含 arm64 和 x86_64, 安装时验证 SHA-256 并自动安装 tmux.
macOS 需要 13 或更新版本, Linux 需要 glibc 2.35 或更新版本.

```sh
brew install jtianling/tap/aoe
brew upgrade jtianling/tap/aoe
```

如果已有 `~/.cargo/bin/aoe`, 请用 `command -v aoe` 核对实际运行路径.
自有发行版见 [GitHub Releases](https://github.com/jtianling/agent-of-empires/releases).

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
