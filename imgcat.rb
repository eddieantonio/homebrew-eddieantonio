class Imgcat < Formula
  desc "It's like cat(1), but for images"
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/releases/download/v2.5.2/imgcat-2.5.2+20231031.tar.gz"
  version "2.5.2"
  sha256 "0b6262a8cd16358eea8e6d2ade4f99dbe61f2ffdbf8fd258024cfa8da13da433"
  head "https://github.com/eddieantonio/imgcat.git"

  depends_on "jpeg"
  depends_on "libpng" => :recommended
  on_linux do
    depends_on "ncurses"
  end

  def install
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
    assert output =~ /\x1b\[48;5;\d+m/
  end
end
