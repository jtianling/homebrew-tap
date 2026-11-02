class Aoe < Formula
  desc "Terminal session manager for AI coding agents, maintained by jt"
  homepage "https://github.com/jtianling/agent-of-empires"
  version "0.1.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    depends_on macos: :ventura

    on_arm do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.1.0/aoe-darwin-arm64.tar.gz"
      sha256 "d97d61067f6772e3c4d00209c9a42c7f4abf658338ee415d4eab2edf9a6b0624"
    end
    on_intel do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.1.0/aoe-darwin-amd64.tar.gz"
      sha256 "0dc6ad2699dae4b4b5a900326ef0227ca07d9966442f652208845465809b89c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.1.0/aoe-linux-arm64.tar.gz"
      sha256 "2dcffc20945d37fc2902d8760ffc64ee9760dedd8ebf95a8e23e897ddcd3f747"
    end
    on_intel do
      url "https://github.com/jtianling/agent-of-empires/releases/download/jt-v0.1.0/aoe-linux-amd64.tar.gz"
      sha256 "1c7135c83a7f8e3003fc308e6ba0c05118ad616cbf9c4f88004e1b7e60c5c888"
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
