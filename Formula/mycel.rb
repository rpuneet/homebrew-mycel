class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.9/mycel_0.2.9_darwin_arm64.tar.gz"
      sha256 "08f8f07ae3f259007e56d3fce6b1a5776597cadaae482664ec8ca2ff3bfbe875"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.9/mycel_0.2.9_darwin_amd64.tar.gz"
      sha256 "d7f39a343f77e5e0bde345836c78d6da8d04a26ee5bed39ba6be330252dafacd"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.9/mycel_0.2.9_linux_arm64.tar.gz"
      sha256 "222857bb16558a78d2a87d955d052998a2359f3bef77116d602c12fd1691ac6b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.9/mycel_0.2.9_linux_amd64.tar.gz"
      sha256 "e6ad795d3bf360af9e9d80d558a0cfe92978beabc70fbec8a09ab2cb3d817bed"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
