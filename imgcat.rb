class Imgcat < Formula
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v2.0.0.tar.gz"
  sha256 "28c9e8bd87d1448748267c38e9c5c4fb9e2c9a307d80c5775bc8919e820a4746"
  head "https://github.com/eddieantonio/imgcat.git"

  depends_on "libpng" => :recommended
  depends_on "jpeg"

  def install
    system "make", "install" ,"PREFIX=#{prefix}"
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
    output = shell_output("#{bin}/imgcat -d 256 #{test_fixtures('test.jpg')}")
    # Ensure that it produces xterm 256 colour output
    assert output =~ /[\x1b]\[48;5;\d+m/
  end
end
