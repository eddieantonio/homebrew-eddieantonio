class Imgcat < Formula
  desc "It's like cat(1), but for images."
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v2.2.1.tar.gz"
  sha256 "8bbc503ed8c4d7495db8f2a867146682897a0b684f127e1870f2a18a64da5e08"
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
    <<~EOS
      The imgcat binary conflicts with iTerm2 3.0's shell script of the same name.
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
