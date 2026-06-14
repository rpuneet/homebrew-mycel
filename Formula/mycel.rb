class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.6/mycel_0.2.6_darwin_arm64.tar.gz"
      sha256 "4a474bdd9a19c0f166ff71020c2441d274599eb5df289d04e60e874d7244583d"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.6/mycel_0.2.6_darwin_amd64.tar.gz"
      sha256 "966d422f7874281001a0d24d10bbbdc80c012916b88823c1660c8d04a47a1c0e"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.6/mycel_0.2.6_linux_arm64.tar.gz"
      sha256 "eb27ac1bc00dcbdf46e64d3b6a6a8da9a4b2058adb8bf1a9e78923fe75adb021"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.6/mycel_0.2.6_linux_amd64.tar.gz"
      sha256 "176291bacf94814c3f788091378e0c4774d262c58b35202a350e859f3cfa7bd6"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
