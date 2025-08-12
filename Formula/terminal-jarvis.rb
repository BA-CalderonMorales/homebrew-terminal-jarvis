# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.55/terminal-jarvis-mac.tar.gz"
    sha256 "ff324b382dc211d9e5b71a4a91ac6d845c2664f0aa3d93b299eaeb3b31a0578c"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.55/terminal-jarvis-linux.tar.gz" 
    sha256 "ff324b382dc211d9e5b71a4a91ac6d845c2664f0aa3d93b299eaeb3b31a0578c"
  end
  
  version "0.0.55"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
