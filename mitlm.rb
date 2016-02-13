class Mitlm < Formula
  desc "The MITLM toolkit for statistical n-gram language models"
  homepage "https://code.google.com/archive/p/mitlm/"
  url "https://github.com/eddieantonio/mitlm/archive/v0.4.2.tar.gz"
  sha256 "3cf63cb50d2f3922c5444faea158c92c0428a335d482c6d651310456cdeb7110"

  depends_on "libtool" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "gcc" => :build

  def install
    system "./autogen.sh", "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    (testpath/"train").write <<-EOF.undent
      if a tree falls in a forest and no one is around to hear does it still make a sound
    EOF
    (testpath/"test").write <<-EOF.undent
      if a tree falls in a forest and no one is around to hear does wilford brimly still make love to a pine tree
    EOF

    system "#{bin}/estimate-ngram", "-text", (testpath/"train"),
                                    "-write-lm", (testpath/"model.lm")
    system "#{bin}/evaluate-ngram", "-lm", (testpath/"model.lm"),
                                    "-eval-perp", (testpath/"test")
  end
end
