class ReloadBrowser < Formula
  desc "Send a refresh keystroke to the active tab in your browser"
  homepage "http://entrproject.org/"
  url "http://entrproject.org/scripts/reload-browser"
  sha256 "3ce1de9420c011c72f39e4d6b337883ff927adf639780e2301f8a10b4f098f16"

  def install
    bin.install "reload-browser"
  end

  test do
    # reload-browser has the side-effect of focusing your browser and actually
    # pressing refresh "duh", so don't do that in the test. Also, it runs with
    # the wronge privelleges, and doesn't work anyway. And if run with no
    # arguments, `reload-browser` always returns an error code. The best thing
    # we can do is check if it's an executable regular file...
    system "test", "-f", "#{bin}/reload-browser"
    system "test", "-x", "#{bin}/reload-browser"
  end
end
