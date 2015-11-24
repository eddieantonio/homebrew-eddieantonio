class Utf8proc < Formula
  desc "Clean C library for processing UTF-8 Unicode data"
  homepage "https://github.com/JuliaLang/utf8proc"
  url "https://github.com/JuliaLang/utf8proc/archive/v1.3.1.tar.gz"
  sha256 "83b60fe21fd8a017b8ad469515873893c8e911a5bef336a427594d398b5688cc"

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    system "make", "check"
  end
end
