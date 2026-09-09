class TerminalJarvis < Formula
  desc "Data-driven harness switcher for AI coding agents"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.19/terminal-jarvis-0.1.19-macos-x64.tar.gz"
      sha256 "28215ba773560091de14c723d3bd803e77d1aa909722b0ad6bd3f41ef69b8e62"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.19/terminal-jarvis-0.1.19-macos-arm64.tar.gz"
      sha256 "4a3cfbb7650e676ef5b70e2abcc974dc1d4c229eeea75d33ccdc088a4ffa44ff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.19/terminal-jarvis-0.1.19-linux-x64-gnu.tar.gz"
      sha256 "625ada94e7a9109f39bc19451765eaf764b5b6e5dadccb4a7d3917d0bda427a8"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.1.19/terminal-jarvis-0.1.19-linux-arm64-gnu.tar.gz"
      sha256 "254a40470f055d02ac712d35179590999c14e4a7c867980ee97782a19d3d74f1"
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
