class IsriOcrEvaluationTools < Formula
  desc "The ISRI Analytic Tools for OCR Evalutaion"
  homepage "https://code.google.com/p/isri-ocr-evaluation-tools/"
  url "https://github.com/eddieantonio/isri-ocr-evaluation-tools/archive/v6.0.1.tar.gz"
  sha256 "647c1287121225891b42f9f52f3345acbb4e271f023644d9d636b3ee3e788a4a"

  depends_on "utf8proc"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"accuracy"
  end
end
