class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.23/terminal-jarvis-0.1.23-macos-x64.tar.gz"
      sha256 "929d20c376f873d8136e018ec474d0745b987663086100bca6180a4ec1e69eda"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.23/terminal-jarvis-0.1.23-macos-arm64.tar.gz"
      sha256 "1865dcac362915c0607690f9282c3e041bcabe38673b31d86510e0fd3d44ad3f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.23/terminal-jarvis-0.1.23-linux-x64-gnu.tar.gz"
      sha256 "ddf05a10b223f512df16dce4e68f8844b625a674acfda2ce3b436035a495f752"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.23/terminal-jarvis-0.1.23-linux-arm64-gnu.tar.gz"
      sha256 "ff21f78591be44e6a5855df636f23c5327d2e91ebc566589940b1b68c9e6cc39"
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
