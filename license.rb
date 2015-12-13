class License < Formula
  desc "Places a LICENSE file in the current directory"
  homepage "https://github.com/eddieantonio/license"
  url "https://github.com/eddieantonio/license/archive/v1.0.0.tar.gz"
  sha256 "b367133a26f76a70bd72def0fd5b71d6c6e0da88e5d097e7c4bb01da70ff2baf"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"license", "mit"
  end
end
