class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.20/terminal-jarvis-0.1.20-macos-x64.tar.gz"
      sha256 "9878c9711582b0d9dec2cbaf5375be81edc08fed802190a43509766af670077c"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.20/terminal-jarvis-0.1.20-macos-arm64.tar.gz"
      sha256 "ad2d03f606f3b76883a479fa1e474802d7b65c92c0528ca961cf55007676505c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.20/terminal-jarvis-0.1.20-linux-x64-gnu.tar.gz"
      sha256 "1c3ec3700830ad243a1a5f3fca25f337f1b9ba34c1e0391e9fa19d5e0286a30e"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.20/terminal-jarvis-0.1.20-linux-arm64-gnu.tar.gz"
      sha256 "197133e9eb0c38cc539051cfa162394acabd3da03b0de908faaac3a3faebba79"
    end
  end

  def install
    bin.install "bin/terminal-jarvis"
    pkgshare.install "harnesses", "gates"
  end

  test do
    assert_match "terminal-jarvis", shell_output("#{bin}/terminal-jarvis --help")
  end
end
