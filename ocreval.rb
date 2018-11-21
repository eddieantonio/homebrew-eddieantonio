class Ocreval < Formula
  desc "Tools for OCR evaluation with UTF-8 support and more"
  homepage "https://github.com/eddieantonio/ocreval"
  url "https://github.com/eddieantonio/ocreval/archive/v7.0.0.tar.gz"
  sha256 "56ece76a6768c595a0070958f4da95c209796298fecfa4edd746f7844b55be5d"
  head "https://github.com/eddieantonio/ocreval.git"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
