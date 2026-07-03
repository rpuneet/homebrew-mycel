class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.1/mycel_0.3.1_darwin_arm64.tar.gz"
      sha256 "658cce492bf9c427fa5766e11b9606140c7474f6235244536acd128363ac470a"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.1/mycel_0.3.1_darwin_amd64.tar.gz"
      sha256 "317b40bbd1c5ac77eecae57af6ed93b1b6af8020b273f1f1a0d5996caa737d36"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.1/mycel_0.3.1_linux_arm64.tar.gz"
      sha256 "b47cb634a6b8a9defd80965a28fbd6f104219c1bd2945f1891f3baf8b713f0a9"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.1/mycel_0.3.1_linux_amd64.tar.gz"
      sha256 "02f7a973837a2521e3dbd081906471c69e5b22b3607387dd587e254c61e9d6fb"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
