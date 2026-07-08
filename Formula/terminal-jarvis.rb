class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.9/terminal-jarvis-0.1.9-macos-x64.tar.gz"
      sha256 "c1cb80cc22ab112db403252078486d09d1a7b18b692f15aed019ecde6d92b875"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.9/terminal-jarvis-0.1.9-macos-arm64.tar.gz"
      sha256 "7311b1d80d2bd336fe51b2ee6f9c7b12a2efee18aa5a809e19abe8b54caaaadc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.9/terminal-jarvis-0.1.9-linux-x64-gnu.tar.gz"
      sha256 "dbeba2746e4ab70667c546672a84898f677e247c6ec30ec1f69b4058c2596e3e"
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
