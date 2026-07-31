class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.1/mycel_0.4.1_darwin_arm64.tar.gz"
      sha256 "390465c52621e660fe4b58b35c8b7583fbaa05017cf2a8aa02737c37d1c11964"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.1/mycel_0.4.1_darwin_amd64.tar.gz"
      sha256 "a2b873b4488bf97973eb38c971afd3d341a660260212f3036eb299f72662fc2c"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.1/mycel_0.4.1_linux_arm64.tar.gz"
      sha256 "01a860359410c0f884b11e90263dd281d6130412089571e73e9ca34d039e34e3"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.1/mycel_0.4.1_linux_amd64.tar.gz"
      sha256 "d2aa57f67a8fb0c5fd3842e8b75fad75fafbe53736771ff5c90cbc92adc55354"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
