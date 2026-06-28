class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.5/terminal-jarvis-0.1.5-macos-x64.tar.gz"
      sha256 "1186cc6cf07f07d0c6fd672d7902786d9492dcaf35ae932f2d5a1f5fb2685563"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.5/terminal-jarvis-0.1.5-macos-arm64.tar.gz"
      sha256 "136a906e40517b05be4a9a9dd3bca761d5abee79bd7cd88f2e2f016547470923"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.5/terminal-jarvis-0.1.5-linux-x64-gnu.tar.gz"
      sha256 "1fa413d8b7b7735441769651f7b26c00fff9a9ea83cc23ed13d5d92a72afd440"
    end
  end

  def install
    bin.install "bin/terminal-jarvis"
    pkgshare.install "harnesses"
  end

  test do
    assert_match "terminal-jarvis", shell_output("#{bin}/terminal-jarvis --help")
  end
end
