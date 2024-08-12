class Emerge < Formula
  desc "Emergetools CLI"
  homepage "https://docs.emergetools.com"
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
    system "true"
  end
end
