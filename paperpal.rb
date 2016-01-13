class Paperpal < Formula
  desc "Paper management with Zotero"
  homepage "https://github.com/eddieantonio/paperpal"
  url "https://github.com/eddieantonio/paperpal/archive/v0.1.1.tar.gz"
  sha256 "e224f88f67dfadd88f0d04957fe6efa8420e6ff4f26e24217e34816cda381a83"

  # Follows Wiki's guide:
  # https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Python-for-Formula-Authors.md#applications
  depends_on :python if MacOS.version <= :snow_leopard

  # Dependencies
  resource "mozrepl" do
    url "https://pypi.python.org/packages/source/m/mozrepl/mozrepl-1.2.4.tar.gz"
    sha256 "461b40ce010659b4a4c001a5862fdcba3316264de03137432e16c62817c4004b"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[mozrepl].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    # Install the binaries.
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/paperpal", "--version"
  end
end
