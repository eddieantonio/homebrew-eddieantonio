class Imgcat < Formula
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v1.1.1.tar.gz"
  sha256 "3d577501934926c2e7724571f553381c4dbfafec1704588b7242d4c6b610dfc9"

  def install
    system "make", "install" ,"PREFIX=#{prefix}"
  end

  def caveats
    <<-EOS.undent
      The imgcat binary conflicts with the iTerm2 version >3.0 script
      that displays 24-bit images inline. You can still use imgcat on
      iTerm2 versions >3, however note that the builtin script may take
      precedence over this package's colour quantized goodness.
    EOS
  end

  test do
    system "#{bin}/imgcat", "--version"
  end
end
