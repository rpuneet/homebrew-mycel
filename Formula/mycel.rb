class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.0/mycel_0.3.0_darwin_arm64.tar.gz"
      sha256 "3c1068296d43369bf19596f1b8d4958e2bedd0488727efe1163a7d02032680c1"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.0/mycel_0.3.0_darwin_amd64.tar.gz"
      sha256 "b63c54e99748cb4d2a7d03ca03abfcda10b0a94048a6d248ba03eadc778c65bc"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.0/mycel_0.3.0_linux_arm64.tar.gz"
      sha256 "9cb352497d0b1a9ebd1f8619bd9cd0f98761d9c2f75c5f974bb9ca46a1d85b3c"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.0/mycel_0.3.0_linux_amd64.tar.gz"
      sha256 "b7f36d7afaeef0b156a1b2b68a35819ab4d145ca5ec61e78ee7367a6899af8dd"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
