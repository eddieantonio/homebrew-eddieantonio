class Imgcat < Formula
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v1.1.0.tar.gz"
  sha1 "584307473d9577df5f8ff1e3d3a89df2bcba4ab2"

  depends_on "scons" => :build

  def install
    system "make", "install" ,"PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/imgcat", "--version"
  end
end
