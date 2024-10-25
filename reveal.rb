class Reveal < Formula
  desc "Interactively reveal lines from a file or stdin, one line at a time"
  homepage "https://github.com/eddieantonio/reveal"
  url "https://github.com/eddieantonio/reveal/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1b7a75d77453a95093202dfa1a5ea6a60fa5f3b0a80def92296db0d9053c6c42"
  license "GPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"reveal", "/dev/null"
  end
end
