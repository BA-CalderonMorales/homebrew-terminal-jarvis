# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.57/terminal-jarvis-mac.tar.gz"
    sha256 "b1b2c5e8f8480e9d55e1bdf339ac018b9f185f2afcffb234cbd61f03c24c814f"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.57/terminal-jarvis-linux.tar.gz" 
    sha256 "b1b2c5e8f8480e9d55e1bdf339ac018b9f185f2afcffb234cbd61f03c24c814f"
  end
  
  version "0.0.57"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
