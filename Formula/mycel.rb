class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.3/mycel_0.3.3_darwin_arm64.tar.gz"
      sha256 "b89c8a8f6d4bf1eb12b0de6070fdff20e3279621bd129c2f2db0a24310043054"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.3/mycel_0.3.3_darwin_amd64.tar.gz"
      sha256 "6b9a8ad0e344d0919959dae6aee26713b2db12f79b70cb0531c99756acbb95a6"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.3/mycel_0.3.3_linux_arm64.tar.gz"
      sha256 "1812955139f979b3957233c6ade4152b50fee4ce63ee4b810dc10f7a78e8a40a"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.3/mycel_0.3.3_linux_amd64.tar.gz"
      sha256 "a5fa171d34194a389254bd8274324d24f8c30863f8ce4e5209e9e114c3e0e6bc"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
