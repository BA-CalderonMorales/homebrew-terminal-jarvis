class TerminalJarvis < Formula
  desc "A unified command center for AI coding tools"
  homepage "https://github.com/BA-CalderonMorales/terminal-jarvis"
  
  if OS.mac?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.59/terminal-jarvis-mac.tar.gz"
    sha256 "e9dcb30ac5be40180168f5d82af07caa12b1636a0fb6814cb6edc5c9a1ae0db1"
  elsif OS.linux?
    url "https://github.com/BA-CalderonMorales/terminal-jarvis/releases/download/v0.0.59/terminal-jarvis-linux.tar.gz" 
    sha256 "55a72bbe08d18a8c2fbddc18738f7e81442b4e8170bc715f06002d48bcb8ad59"
  end
  
  version "0.0.59"

  def install
    bin.install "terminal-jarvis"
  end

  test do
    system "#{bin}/terminal-jarvis", "--version"
  end
end
