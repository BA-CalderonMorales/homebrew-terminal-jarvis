class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.25/terminal-jarvis-0.1.25-macos-x64.tar.gz"
      sha256 "5b5a2d9920a47ef4e29cd8e2e9f05689e0b0c874dff32a86a08cbee9a6282f61"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.25/terminal-jarvis-0.1.25-macos-arm64.tar.gz"
      sha256 "04535ac16ebd6295fdc728996a3d45c2fc9f2d2a83ea239518b7cecd062d9c34"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.25/terminal-jarvis-0.1.25-linux-x64-gnu.tar.gz"
      sha256 "0d84a9f4f20e387430791c08d28b7ac7f509259021d6ec64d6108d5526795134"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.25/terminal-jarvis-0.1.25-linux-arm64-gnu.tar.gz"
      sha256 "9193293e5a47fb705a3db8935cc8ea16f30a13ea8fff6c06d7eb46791737134d"
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
