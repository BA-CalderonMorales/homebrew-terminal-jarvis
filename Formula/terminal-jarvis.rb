class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.7/terminal-jarvis-0.1.7-macos-x64.tar.gz"
      sha256 "55ad64a2ada5ef19a65aade09c72fa7c5bdd3d922a967d101ddc416c24974461"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.7/terminal-jarvis-0.1.7-macos-arm64.tar.gz"
      sha256 "79171f30a067285a3fb7e5dd975fa32db0200f254b735587d543ecc0954fbfd5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.7/terminal-jarvis-0.1.7-linux-x64-gnu.tar.gz"
      sha256 "a47ef3faed0ed405abf576026ce2d1ce4dfaa29567179d90ee6a1a8a8bbf567c"
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
