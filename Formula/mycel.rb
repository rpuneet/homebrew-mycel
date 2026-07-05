class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.12/mycel_0.3.12_darwin_arm64.tar.gz"
      sha256 "11722ae3ac4f4a594cc37cfd0d039e69a368bed1524f3c92cdd45a18f547ae55"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.12/mycel_0.3.12_darwin_amd64.tar.gz"
      sha256 "790fbb415694bfcb57b99a32f8c28fbe20f542a572fc8576a926d0007580ba4a"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.12/mycel_0.3.12_linux_arm64.tar.gz"
      sha256 "b549565b85533191996d51b933f95dae544142f632954f5ff292fec48149bf5b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.12/mycel_0.3.12_linux_amd64.tar.gz"
      sha256 "876ccb9b547256ddb1b1635f6017e6ebf39f18f99b6df36016a2853c66ee9fae"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
