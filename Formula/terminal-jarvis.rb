# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  version "0.0.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.60/terminal-jarvis-macos-x86_64.tar.gz"
      sha256 "d67d3e2debe8785e38f502a1ae6e0cc3366d861458c528f3537a2a01cfe950c2"
    elsif Hardware::CPU.arm?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.60/terminal-jarvis-macos-aarch64.tar.gz"
      sha256 "cf121c81e71781c5a84199fdefe930e084df0a040d98acff8b2a44f668d713b6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.60/terminal-jarvis-linux-x86_64.tar.gz"
      sha256 "26a31c401d92a8731105fa22e288f4845ca5c5bd3b0f90f6406c5dae2c128dc3"
    else
      # Fallback for other Linux architectures
      url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.60/terminal-jarvis-linux.tar.gz"
      sha256 "86b9374b464f5a0e65f0c484c160d394223e8a05af31e459bb4dc87e404ee06f"
    end
  end

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
