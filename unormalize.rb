class Unormalize < Formula
  desc "Perform Unicode normalization"
  homepage "https://github.com/eddieantonio/unormalize"
  url "https://github.com/eddieantonio/unormalize/archive/v0.1.1.tar.gz"
  sha256 "ba8db90deb671c1b00d13b67b5b9dd16ab1c06255f30df8020bb677a4918e308"

  depends_on "python" if MacOS.version <= :snow_leopard

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    # Install the binaries.
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])

    # Install manpage.
    man1.install Dir["man/*.1"]
  end

  test do
    (testpath/"test").write <<-EOF.undent
    ｶℍ①
    EOF
    system bin/"nfkc", testpath/"test"
  end
end
