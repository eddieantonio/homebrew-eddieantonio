class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v6.0.0.tar.gz"
  sha256 "167a0edd69d3e6ba99764b0d8aba83f83eb0c6bb7156040de197c832b130b3cd"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
