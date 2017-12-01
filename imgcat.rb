class Imgcat < Formula
  desc "It's like cat(1), but for images."
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v2.1.0.tar.gz"
  sha256 "46cc09de4bceb2f1c0ecba06808fcfcfaf936ec2382c0b0a70d4346234654859"
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
