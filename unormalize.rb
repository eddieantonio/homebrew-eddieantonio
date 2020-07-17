class Unormalize < Formula
  include Language::Python::Virtualenv

  desc "Perform Unicode normalization"
  homepage "https://github.com/eddieantonio/unormalize"
  url "https://files.pythonhosted.org/packages/ba/da/a3100dfa5b5732b1cfce76cc6bbdad9c90e660ec0967eacb07a985806446/unormalize-2020.7.17.tar.gz"
  sha256 "bcfd7ea96da3b6f62defaedbfdb2a0615a6d6e77bf6edc3c1881255302443229"

  depends_on "python@3.8"

  def install
    virtualenv_install_with_resources

    # Install manpages.
    man1.install Dir["man/*.1"]
  end

  test do
    (testpath/"test").write <<-EOF
    ｶℍ①
    EOF
    system bin/"nfkc", testpath/"test"
  end
end
