class ReloadBrowser < Formula
  desc "send a refresh keystroke to the active tab in your browser"
  homepage "http://entrproject.org/"
  url "http://entrproject.org/scripts/reload-browser"
  sha256 "3ce1de9420c011c72f39e4d6b337883ff927adf639780e2301f8a10b4f098f16"

  def install
    system "install", "-d", bin
    system "install", "reload-browser", bin
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test reload`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
