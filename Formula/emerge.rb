class Emerge < Formula
  desc ""
  homepage ""
  url "https://github.com/chromy/emerge-cli/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "39cdd1d08eb87a0edb27fd3ffaabb5a8a7e1f71b491f7eb61d577b972810bcd1"
  license "MIT"

  head "https://github.com/chromy/emerge-cli.git", branch: "main"

  depends_on "node" => :build
  depends_on "pnpm" => :build

  def install
    system "pnpm", "install"
    system "tools/build"
    system "tools/bundle"
    system "tools/package"
    bin.install "out/emerge"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test emerge`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
