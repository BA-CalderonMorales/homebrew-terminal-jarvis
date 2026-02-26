# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.77/terminal-jarvis-mac.tar.gz"
    sha256 "6df663506bc844551b18d6939d458e6e177fd05daf9715046b278ceda6d4ec5a"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.77/terminal-jarvis-linux.tar.gz" 
    sha256 "c2cd5f8a57fe58b7d40314daf75cca8adf96d678fcc85fef25be1d4426fd6a21"
  end
  
  version "0.0.77"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
