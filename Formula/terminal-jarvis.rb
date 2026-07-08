class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.8/terminal-jarvis-0.1.8-macos-x64.tar.gz"
      sha256 "17a815728d1f57a3ba9a149efaad18bf450bf2d8a7cc98c156ffb9977153f607"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.8/terminal-jarvis-0.1.8-macos-arm64.tar.gz"
      sha256 "6473459d41c1a6ef954a596fbbdab182b5919efdded7f74a1f3169133b338de9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.8/terminal-jarvis-0.1.8-linux-x64-gnu.tar.gz"
      sha256 "d2742277e02ea3a2a15aee925916bc4799eb7701951cd05412a5efc6ac2da3be"
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
