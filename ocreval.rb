class Ocreval < Formula
  desc "Tools for OCR evaluation with UTF-8 support and more"
  homepage "https://github.com/eddieantonio/ocreval"
  url "https://github.com/eddieantonio/ocreval/archive/v7.0.1.tar.gz"
  sha256 "00cd54f806d122b1accd32470eb54ae939483708f1ef49838f848714ee18c47a"
  head "https://github.com/eddieantonio/ocreval.git"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
