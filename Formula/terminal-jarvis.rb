class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.13/terminal-jarvis-0.1.13-macos-x64.tar.gz"
      sha256 "4dfa713dc92f86cc1138b62c6625a42e3cd61257d406828ab97d6f962f681a1f"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.13/terminal-jarvis-0.1.13-macos-arm64.tar.gz"
      sha256 "0bcc797b550cf1c347b5690563936bba460d2289037e79a73eb5f6cd510079c7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.13/terminal-jarvis-0.1.13-linux-x64-gnu.tar.gz"
      sha256 "cf7bd01390fbac9f450ef6b56f2fc85985ef32754905c5ae07e5d11513cca0b3"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.13/terminal-jarvis-0.1.13-linux-arm64-gnu.tar.gz"
      sha256 "3c3681bbaa5aca16725e2c419ee70134a6e7c0de7f95f98d9029fdc8d5aa4503"
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
