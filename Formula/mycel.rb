class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.6/mycel_0.3.6_darwin_arm64.tar.gz"
      sha256 "27908f573fa24ce1108596d6de69ed4ce81e710286bda94e965df887fc1e990f"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.6/mycel_0.3.6_darwin_amd64.tar.gz"
      sha256 "415e6030867ed34e743f78ddc58e639476baed709e9ce857c7b7b0b42f6c6c6f"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.6/mycel_0.3.6_linux_arm64.tar.gz"
      sha256 "5f12e882dc5d895557d964591721c49b5e2aeb89facd1c3da36f011b8f70fae9"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.6/mycel_0.3.6_linux_amd64.tar.gz"
      sha256 "9c21225f99fde25c5d4b6c478fde8c355c5210a98617a7deba9872b121a316d6"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
