class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.12/terminal-jarvis-0.1.12-macos-x64.tar.gz"
      sha256 "9f253f6661a9fc0944f2f858716fe0a02a812d9f3044a34403001ab8c7f22ca8"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.12/terminal-jarvis-0.1.12-macos-arm64.tar.gz"
      sha256 "64f00d35bca4cbf2c01aa0a057705c1fb238a637971d34d528c6ef2303436f79"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.12/terminal-jarvis-0.1.12-linux-x64-gnu.tar.gz"
      sha256 "7635042a346cf88106c0b0ef5ddb65f75433548bf8a6eb78588cdcb55cf4bf49"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.12/terminal-jarvis-0.1.12-linux-arm64-gnu.tar.gz"
      sha256 "4247905f79fce5f5e9d511e3ab476d9e9cc83e614bc82d6892b11e7ea4c59bd5"
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
