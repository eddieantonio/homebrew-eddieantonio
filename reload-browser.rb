class ReloadBrowser < Formula
  desc "Send a refresh keystroke to the active tab in your browser"
  homepage "http://entrproject.org/"
  url "http://entrproject.org/scripts/reload-browser"
  sha256 "712cd7d7b76e6cbe58925ae814f021f45ab4cf00862f1554505336e6108752a1"

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
