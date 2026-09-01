class DualYazi < Formula
  desc "Dual-pane file manager based on yazi"
  homepage "https://github.com/jtianling/dual-yazi"
  url "https://github.com/jtianling/dual-yazi/releases/download/v0.1.0-dual/dual-yazi-0.1.0-dual.tar.gz"
  version "0.1.0-dual"
  sha256 "0d08d0992788f8f91d85b0eec20a430317e8a911e522b598a0ce08dc0859cf0d"
  license "MIT"
  head "https://github.com/jtianling/dual-yazi.git", branch: "main"

  depends_on "rust" => :build

  conflicts_with "yazi",
    because: "dual-yazi installs the same `yazi` and `ya` binaries as upstream yazi"

  def install
    ENV["VERGEN_GIT_SHA"] = tap.user
    ENV["YAZI_GEN_COMPLETIONS"] = "1"
    system "cargo", "install", *std_cargo_args(path: "yazi-fm")
    system "cargo", "install", *std_cargo_args(path: "yazi-cli")

    bash_completion.install "yazi-boot/completions/yazi.bash" => "yazi"
    zsh_completion.install "yazi-boot/completions/_yazi"
    fish_completion.install "yazi-boot/completions/yazi.fish"

    bash_completion.install "yazi-cli/completions/ya.bash" => "ya"
    zsh_completion.install "yazi-cli/completions/_ya"
    fish_completion.install "yazi-cli/completions/ya.fish"
  end

  test do
    assert_match "Yazi", shell_output("#{bin}/yazi --version").strip
    assert_match "Ya", shell_output("#{bin}/ya --version").strip
  end
end
