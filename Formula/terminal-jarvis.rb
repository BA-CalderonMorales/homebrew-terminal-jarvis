class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.10/terminal-jarvis-0.1.10-macos-x64.tar.gz"
      sha256 "aa89b617b2dfa9697c8aee703123b2b8796acd8816c52bafa3951e3b37f2bb63"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.10/terminal-jarvis-0.1.10-macos-arm64.tar.gz"
      sha256 "35411e7a13b227b5627c07a8b9446fad015e39f21d7f64e8c4e214de482639ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.10/terminal-jarvis-0.1.10-linux-x64-gnu.tar.gz"
      sha256 "cfcbe7f8eb5d60b183407aebec8e509f1478a68df6ab849602da8b321316e687"
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
