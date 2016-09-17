class Brainmuk < Formula
  desc "brainfuck x86 compiler and interpreter"
  homepage "https://github.com/eddieantonio/brainmuk"
  url "https://github.com/eddieantonio/brainmuk/archive/v0.2.2.tar.gz"
  sha256 "20ec1fd7fe9544175583cd9ea3367b36380f95bfc881bb34c678beb014a51c15"
  head "https://github.com/eddieantonio/brainmuk.git"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/brainmuk", "--version"
  end
end
