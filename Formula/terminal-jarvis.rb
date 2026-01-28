# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.75/terminal-jarvis-mac.tar.gz"
    sha256 "f3410dada820105efdaf56f0f5c4b6830dda820948f102332e6fb84dd5ed6624"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.75/terminal-jarvis-linux.tar.gz" 
    sha256 "5115b6df01f1eacfef41d78d0a80927cb33d30a1a56a1bc25061ca53a4979618"
  end
  
  version "0.0.75"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
