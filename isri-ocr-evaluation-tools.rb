class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v6.1.1.tar.gz"
  sha256 "b166bc7bcf56bcfc5f7e2c0ee82ad467d57f4a0487afd93526c37d2d6a0e333f"
  head "https://github.com/eddieantonio/isri-ocr-evaluation-tools.git"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
