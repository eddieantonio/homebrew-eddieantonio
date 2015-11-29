class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v6.0.0-rc.2.tar.gz"
  version "6.0.0-rc.2"
  sha256 "b63c3f2e2bdf34fc3c5eb291c0e3f2200523fe6f0c645a433f304f442b7c471f"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
