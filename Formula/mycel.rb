class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.4/mycel_0.4.4_darwin_arm64.tar.gz"
      sha256 "5862c1ac611d95a34bb0b2dec76a2eb48b300e00962ddb0b9e0ad0949ecb5c4b"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.4/mycel_0.4.4_darwin_amd64.tar.gz"
      sha256 "a45b8910aa94f76d9fb18535efe048570373ac37c6e33927d1c15d9786866de2"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.4/mycel_0.4.4_linux_arm64.tar.gz"
      sha256 "e5ac6f40ccf91a950fd6838e4b9d03809141a1637e1d144fc38be3423e866ee0"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.4/mycel_0.4.4_linux_amd64.tar.gz"
      sha256 "dc3d4f68ef449d832f79cc90372eb65a935691b2d16c08cbe68ab05dc28eed01"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
