class Ocreval < Formula
  desc "Tools for OCR evaluation with UTF-8 support and more"
  homepage "https://github.com/eddieantonio/ocreval"
  url "https://github.com/eddieantonio/ocreval/archive/v7.0.2.tar.gz"
  sha256 "cdc0c632ac2139ba2d7b05005c0f07da1f56d1bb01024db052ba0b8bcfd0d8e3"
  head "https://github.com/eddieantonio/ocreval.git"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
