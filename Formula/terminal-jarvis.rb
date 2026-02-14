# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.76/terminal-jarvis-mac.tar.gz"
    sha256 "1fcee8f85b05a467202e1edf33cdf8dc28aff118a9fe3855628dbff3a82066e3"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.76/terminal-jarvis-linux.tar.gz" 
    sha256 "bf3c3565b902cc0c5ab5c1ba2f1e552533b8a5a682ae0ba84d7be278d9fc6ea7"
  end
  
  version "0.0.76"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
