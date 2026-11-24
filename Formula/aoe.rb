class Aoe < Formula
  desc "Terminal session manager for AI coding agents, maintained by jt"
  homepage "https://github.com/jtianling/agent-of-empires"
  version "0.2.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    depends_on macos: :ventura

    on_arm do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.2.0/aoe-darwin-arm64.tar.gz"
      sha256 "85efdab406fc433421a69743745ce6a53df00e904d5e3e4a2bb665eebf1d90ae"
    end
    on_intel do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.2.0/aoe-darwin-amd64.tar.gz"
      sha256 "98504d694565a728d16d471ffbd8a5e6be2b7c6f75c421d824e6bf6b4895c825"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.2.0/aoe-linux-arm64.tar.gz"
      sha256 "3e43e0ecda162000300b7a7b4a65e8b095c4fc0f11ffb4606f3ad8a94854f3db"
    end
    on_intel do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.2.0/aoe-linux-amd64.tar.gz"
      sha256 "9ce258717adf188bbe00d6681ba1cf131bfa7485ab8e3f8730021f79142a0da2"
    end
  end

  def install
    platform = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "aoe-#{platform}-#{arch}" => "aoe"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aoe --version")
    assert_match "recover-codex", shell_output("#{bin}/aoe session --help")
  end
end
