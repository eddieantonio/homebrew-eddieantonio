class Brainmuk < Formula
  desc "brainfuck x86 compiler and interpreter"
  homepage "https://github.com/eddieantonio/brainmuk"
  url "https://github.com/eddieantonio/brainmuk/archive/v0.2.1.tar.gz"
  sha256 "c78525df49f878ad830ada8dac2d51692fe1e77cac7e29503a5494be3b51999f"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/brainmuk", "--version"
  end
end
