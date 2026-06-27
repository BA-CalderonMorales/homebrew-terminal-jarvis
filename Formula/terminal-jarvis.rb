class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.2/terminal-jarvis-0.1.2-macos-x64.tar.gz"
      sha256 "361c9fc22e90312514f01e4f98fc9969c1114f29f5bd6264400b8690465b37e5"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.2/terminal-jarvis-0.1.2-macos-arm64.tar.gz"
      sha256 "260ccaa8dfc603c90a6b210e14bca989db471cd6ead04b5f4a7bfaa7822f6a3e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.2/terminal-jarvis-0.1.2-linux-x64-gnu.tar.gz"
      sha256 "8e54377e175842ab903580d36a43d003e87caf1e606875ffddac791b765c47a2"
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
