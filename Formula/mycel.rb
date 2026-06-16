class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.8/mycel_0.2.8_darwin_arm64.tar.gz"
      sha256 "2a253f1793699b96f5de8138654efb22580eaa5eef73e6a52419a00bf0313468"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.8/mycel_0.2.8_darwin_amd64.tar.gz"
      sha256 "ad55644e13b7824d98738c1a34e7d18df3c82264035bce2806a0e6a1849b8db1"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.8/mycel_0.2.8_linux_arm64.tar.gz"
      sha256 "f33b396ae01567ad50876e4a309f690876c24b549f0da3dd354db171644c1ed8"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.8/mycel_0.2.8_linux_amd64.tar.gz"
      sha256 "120c40c87f6645fe76a181d09c4d9ef6b8fdd61a39e69afb873f811a879c3c54"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
