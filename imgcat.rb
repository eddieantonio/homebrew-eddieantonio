class Imgcat < Formula
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v1.1.0.tar.gz"
  sha256 "1c171ba432281b9febb698c82c000e4b33918de2c95c4ee38be7db027d85764c"

  depends_on "scons" => :build

  def install
    system "make", "install" ,"PREFIX=#{prefix}"
  end

  test do
    system "#{bin}/imgcat", "--version"
  end
end
