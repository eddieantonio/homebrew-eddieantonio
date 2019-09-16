class Brainmuk < Formula
  desc "Brainfuck x86 compiler and interpreter"
  homepage "https://github.com/eddieantonio/brainmuk"
  url "https://github.com/eddieantonio/brainmuk/archive/v0.3.0.tar.gz"
  sha256 "4191caa7a7d310160e7bb99b2163f57fcc5e25c151b38ff48a4ab04d1e6edac7"
  head "https://github.com/eddieantonio/brainmuk.git"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/brainmuk", "--version"
  end
end
