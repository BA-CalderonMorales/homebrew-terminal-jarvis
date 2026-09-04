class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.17/terminal-jarvis-0.1.17-macos-x64.tar.gz"
      sha256 "9c060b49001e8d11ece9f1db836d221cec627dc333dec945deb0f171d1ce8664"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.17/terminal-jarvis-0.1.17-macos-arm64.tar.gz"
      sha256 "560fb7d345ef2e6ddba6354df352bc001e4c1170351b5ecc03450ec91a4986d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.17/terminal-jarvis-0.1.17-linux-x64-gnu.tar.gz"
      sha256 "d164700a44f034b3c11193c04ffe306e4c11b50e8a7413a373dd9075f722a82c"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.17/terminal-jarvis-0.1.17-linux-arm64-gnu.tar.gz"
      sha256 "03b459d814b20dfcb15544d90b62af1b2784cd1c67b2d2692852091c94a6ad90"
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
