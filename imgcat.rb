class Imgcat < Formula
  homepage "https://github.com/eddieantonio/imgcat"
  url "https://github.com/eddieantonio/imgcat/archive/v1.0.0.tar.gz"
  sha1 "6c86e9eb6bed6b3e26902f0c502a890ea4861671"

  depends_on "scons" => :build

  def install
    system "make", "install" ,"PREFIX=#{prefix}"
  end

  test do
    # Not the best test but :/
    system "#{bin}/imgcat", "-h"
  end
end
