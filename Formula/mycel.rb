class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.2/mycel_0.4.2_darwin_arm64.tar.gz"
      sha256 "8983c16da348a71955a3eda79f6eb87946a356e4dff3e03a1dfe48702eff433a"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.2/mycel_0.4.2_darwin_amd64.tar.gz"
      sha256 "46a7a77a348d0e36fa1abe5f57e76eda293fccc8c68aef8f9459abd98cfea08a"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.2/mycel_0.4.2_linux_arm64.tar.gz"
      sha256 "31398bb105722b15b633ba4d7399cc8731c240ea5e7e1d1c18322a1f4213fc86"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.2/mycel_0.4.2_linux_amd64.tar.gz"
      sha256 "8dad4bf16f588e99730400598b59102959bd52635ec8914ce0a4fd72e2e32769"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
