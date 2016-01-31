class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v6.1.0.tar.gz"
  sha256 "991a367dd55097bf095b99f07e30dfc7f782c9bbdf56033188ee1925c0233ec8"
  head "https://github.com/eddieantonio/isri-ocr-evaluation-tools.git"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
