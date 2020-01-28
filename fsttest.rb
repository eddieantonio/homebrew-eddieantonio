class Fsttest < Formula
  include Language::Python::Virtualenv

  desc "Test your Foma FSTs"
  homepage "https://github.com/eddieantonio/fsttest"
  url "https://files.pythonhosted.org/packages/53/c3/c9013f365e9c97a4c09312c0c484e9ceea0f25f3c37dd7a591e36e920758/fsttest-0.5.0.tar.gz"
  sha256 "34c8a3e4b95c7a6b177852740c11d3c996140371a4595195112b2d3caa2fbeb6"
  head "https://github.com/eddieantonio/fsttest.git"

  depends_on "python"

  resource "blessings" do
    url "https://files.pythonhosted.org/packages/5c/f8/9f5e69a63a9243448350b44c87fae74588aa634979e6c0c501f26a4f6df7/blessings-1.7.tar.gz"
    sha256 "98e5854d805f50a5b58ac2333411b0482516a8210f23f43308baeb58d77c157d"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/21/9f/b251f7f8a76dec1d6651be194dfba8fb8d7781d10ab3987190de8391d08e/six-1.14.0.tar.gz"
    sha256 "236bdbdce46e6e6a3d61a337c0f8b763ca1e8717c03b369e87a7ec7ce1319c0a"
  end

  resource "toml" do
    url "https://files.pythonhosted.org/packages/b9/19/5cbd78eac8b1783671c40e34bb0fa83133a06d340a38b55c645076d40094/toml-0.10.0.tar.gz"
    sha256 "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"
  end

  def install
    virtualenv_create(libexec, "python3")
    # HACK!
    #   pip looks at the pyproject.toml and it determines that it must use
    #   poetry... for something---blame it on PEP 517 and PEP 518:
    #     https://www.python.org/dev/peps/pep-0518/
    #   But! poetry is no longer needed at this
    #   point. Also, poetry is never installed. 🙃🙃🙃
    #   So... remove pyproject.toml to prevent a flagrant build failure!
    rm_f("pyproject.toml")
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/fsttest", "--version"
  end
end
