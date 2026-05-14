# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# Based on Federico Terzi's approach: https://federicoterzi.com/blog/how-to-publish-your-rust-project-on-homebrew/

class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.82/terminal-jarvis-mac.tar.gz"
    sha256 "19de7b5e48fc21e6ddb3aad261ebc4ffd90fe45f6d01b9516d05f9774e8dc54c"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.82/terminal-jarvis-linux.tar.gz" 
    sha256 "68059ad419aed4d2099879c0a390124b4cfafa220b7239ce99226e2cd9638871"
  end
  
  version "0.0.82"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
