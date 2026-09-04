class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.18/terminal-jarvis-0.1.18-macos-x64.tar.gz"
      sha256 "5fa3da6bea205c94c75396235a41124a61ff032cb5c8a90ec4c6011d1914ccb9"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.18/terminal-jarvis-0.1.18-macos-arm64.tar.gz"
      sha256 "4468887f7fa6baadd8fbeb6885cd6ad57e0a6947181ecaef510df488260e84ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.18/terminal-jarvis-0.1.18-linux-x64-gnu.tar.gz"
      sha256 "5aa544501c0baa09f52322e5d52e015e3e652bad6b7aa33f2290f1304e8c126f"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.18/terminal-jarvis-0.1.18-linux-arm64-gnu.tar.gz"
      sha256 "220e3a497d0eda79675ec478017e4102ab7c6eb7bf767fcab75cbe3ef4eb7031"
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
