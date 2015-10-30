class ExtendedAscii < Formula
  desc "Converts UTF-8 to ISRI extended ASCII"
  homepage "https://github.com/eddieantonio/isri-extended-ascii"
  url "https://github.com/eddieantonio/isri-extended-ascii/archive/v1.0.1.tar.gz"
  sha256 "3d7f7b5387c5801ff75df8e344bbb9394de1d53f62cf68219e0a10cde0ce4a09"

  # Follows Wiki's guide:
  # https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Python-for-Formula-Authors.md#applications
  depends_on :python if MacOS.version <= :snow_leopard

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
    AΩא
    EOF
    system bin/"extended_ascii", testpath/"test"
  end
end
