# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.56/terminal-jarvis-mac.tar.gz"
    sha256 "acfcd6617bf3ae0261a811a6aa1f06b0eb0b751a564f43e9b3120cf70dc07eb2"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.56/terminal-jarvis-linux.tar.gz" 
    sha256 "acfcd6617bf3ae0261a811a6aa1f06b0eb0b751a564f43e9b3120cf70dc07eb2"
  end
  
  version "0.0.56"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
