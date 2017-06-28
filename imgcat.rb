class Imgcat < Formula
  desc "It's like cat(1), but for images."
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v2.0.1.tar.gz"
  sha256 "049ec5383301188a2daa872623b6b1bb6097ccd4f57ee4f036e26fc853e90243"
  head "https://github.com/eddieantonio/imgcat.git"

  depends_on "libpng" => :recommended
  depends_on "jpeg"
  depends_on "autoconf" => :build

  def install
    system "autoconf"
    system "./configure"
    system "make", "install", "PREFIX=#{prefix}"
  end

  def caveats
    <<-EOS.undent
      The imgcat binary conflicts with iTerm2 3.0's shell script of the same
      To use this formula as drop-in replacement, add `unalias imgcat` to your
      shell startup file **after** sourcing the shell integration, like so:

          unalias imgcat
    EOS
  end

  test do
    output = shell_output("#{bin}/imgcat -d 256 #{test_fixtures("test.jpg")}")
    # Ensure that it produces xterm 256 colour output
    assert output =~ /[\x1b]\[48;5;\d+m/
  end
end
