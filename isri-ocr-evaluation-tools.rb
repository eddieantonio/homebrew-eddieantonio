class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v6.1.2.tar.gz"
  sha256 "6da4bde45250f35209ccadbf7b1c223040a19c65fca4bf0ba704d03f71214f8e"
  head "https://github.com/eddieantonio/isri-ocr-evaluation-tools.git"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
