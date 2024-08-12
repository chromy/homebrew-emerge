class Emerge < Formula
  desc "Emergetools CLI"
  homepage "https://docs.emergetools.com"
  url "https://github.com/chromy/emerge-cli/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "9e6f0b804b236b13cfc63e2571576e950728b9c46101c7cfb033d937a6bbd1f5"
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
