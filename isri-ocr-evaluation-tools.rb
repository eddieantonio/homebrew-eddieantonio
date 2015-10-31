class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v1.0.0.tar.gz"
  sha256 "189afbd7dd4f740baeb9e8597f7c61dfe9124d170ca8ab2511f091601df4531d"

  def install
    system "make", "-C", "analytic-tools", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
