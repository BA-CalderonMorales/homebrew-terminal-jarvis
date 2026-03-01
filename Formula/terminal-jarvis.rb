# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.78/terminal-jarvis-mac.tar.gz"
    sha256 "4b850d41c8b46d31c60370f22fe2656ebaa8e68adca4f841b0f8e9bc0933afb6"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.78/terminal-jarvis-linux.tar.gz" 
    sha256 "2c4c28f4b498cb302d3133897f2ed18fefd6a69c6eb19e9878ba3f034a100731"
  end
  
  version "0.0.78"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
