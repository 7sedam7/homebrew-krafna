class Krafna < Formula
  desc "CLI alternative to Obsidian Dataview plugin for querying Markdown files with SQL"
  homepage "https://github.com/7sedam7/krafna"
  url "https://github.com/7sedam7/krafna/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "d13815dac627aaa6627404459bd08206f76cc27c78be4284a713ca45237d5e34"
  license "MIT"
  version "0.5.1"

  bottle do
    root_url "https://github.com/7sedam7/krafna/releases/download/v0.3.0"
    # sha256 cellar: :any_skip_relocation, arm64_big_sur: "SHA256_HASH"
    sha256 cellar: :any_skip_relocation, arm64_apple_darwin:  "3715fb98b9a647e17212e979a460b957a0c44b1c1ac7c08a06f6ec685c435dfd"
    sha256 cellar: :any_skip_relocation, arm64_linux:         "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    sha256 cellar: :any_skip_relocation, x86_64_apple_darwin: "5c85ec77ba1c55cb0f306a43b491dedaf91ef657bb7555fed6d52ec4d87a92ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux_musl:   "107b3a78c8b2a761a3355f5f3ba2d991bc5d576f18930b33180d8deee06d0089"
    sha256 cellar: :any_skip_relocation, aarch64_linux_musl:  "1a1711d2604c7426e0ae9fd31168d2c2baaec2e0f77fd3536b54a4cecc3b2c56"
    sha256 cellar: :any_skip_relocation, x86_64_linux:        "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_empty shell_output("#{bin}/krafna --help").strip
    assert_match "Usage: krafna", shell_output("#{bin}/krafna --help")
  end
end

