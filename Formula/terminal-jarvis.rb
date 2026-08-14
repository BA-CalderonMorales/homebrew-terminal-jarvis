class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.15/terminal-jarvis-0.1.15-macos-x64.tar.gz"
      sha256 "2823834b7d89c78cde5288af1039580188a1f4d0c8cdf77cd7a5c5b61014f710"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.15/terminal-jarvis-0.1.15-macos-arm64.tar.gz"
      sha256 "eb0649119985315b5bcfca4475686bd604b9a3330b72c65e9c6ef9a26fbb36cb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.15/terminal-jarvis-0.1.15-linux-x64-gnu.tar.gz"
      sha256 "e09555cea842c0bf606428c3cf7419bf2523690954971d036bf3030aba4160f0"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.15/terminal-jarvis-0.1.15-linux-arm64-gnu.tar.gz"
      sha256 "9aeb4d30b02c43103e87e0f492f6975e69f5ae5eff20794066fdfe2ba0413b84"
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
