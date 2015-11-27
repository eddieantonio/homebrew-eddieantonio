class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v6.0.0-rc.1.tar.gz"
  version "6.0.0-rc.1"
  sha256 "82db678506b053dec7fe929d0b91bb83f18f1a6bdcc7c20538d56ad773bcc394"

  depends_on "utf8proc"

  def install
    system "make", "-C", "analytic-tools", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
