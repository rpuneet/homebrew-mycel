class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.6/mycel_0.4.6_darwin_arm64.tar.gz"
      sha256 "6cb7b76e995269e34fed20dfd9e860ddace441c01127ff6023282c159a7608c0"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.6/mycel_0.4.6_darwin_amd64.tar.gz"
      sha256 "9264d82f301c437030efe425b926c851b0f8e79d91a2cf204d2ae2449573f4f1"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.6/mycel_0.4.6_linux_arm64.tar.gz"
      sha256 "3cdedc167f7602fa72556f8513e3506042af9c0f4996809db2bca7b4407cfed6"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.6/mycel_0.4.6_linux_amd64.tar.gz"
      sha256 "7225b2a072d817cdbb5b67da0ae5c0aa8ca0adb18af0d40973054a1009f1ff6e"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
