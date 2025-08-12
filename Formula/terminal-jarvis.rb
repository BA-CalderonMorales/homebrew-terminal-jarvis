# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.54/terminal-jarvis-mac.tar.gz"
    sha256 "3d96ba6817d182ece94c3fc54ad0d74cfc6c369f41c40a1666e8a2e2b923aedf"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.54/terminal-jarvis-linux.tar.gz" 
    sha256 "3d96ba6817d182ece94c3fc54ad0d74cfc6c369f41c40a1666e8a2e2b923aedf"
  end
  
  version "0.0.54"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
