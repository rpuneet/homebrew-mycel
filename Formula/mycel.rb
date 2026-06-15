class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.7/mycel_0.2.7_darwin_arm64.tar.gz"
      sha256 "15dd5324b3618a4c63b53c9aa1c91b63f69947eb136184d474c115079691077b"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.7/mycel_0.2.7_darwin_amd64.tar.gz"
      sha256 "1399faa6a3ebe9cfdca28374f16221fc95549aa4eb71ddc9e1fb5463916b5063"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.7/mycel_0.2.7_linux_arm64.tar.gz"
      sha256 "d3ede915affc67c61b62cae939dd7dec6a64ea2666ee9bf50888215ad43759b3"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.7/mycel_0.2.7_linux_amd64.tar.gz"
      sha256 "8a85f22395f0e7a214aa6e2e22247b57d964b7a0d365bb33bd260c79a90f7059"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
