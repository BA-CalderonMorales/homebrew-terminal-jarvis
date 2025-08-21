# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.61/terminal-jarvis-mac.tar.gz"
    sha256 "18ca78d93624a293b3b071d7f99601c7779d6080550e80b45f3374b096b6cf58"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.61/terminal-jarvis-linux.tar.gz" 
    sha256 "4c5974621e8b272378751712787f7a35a83d5bd0d0c063ed114147135c42a71d"
  end
  
  version "0.0.61"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
