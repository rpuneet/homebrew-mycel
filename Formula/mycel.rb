class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.3/mycel_0.4.3_darwin_arm64.tar.gz"
      sha256 "c4b016adb5ec862f379ac3071486bd4f624f2157afb6b25e302376ea98403dd3"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.3/mycel_0.4.3_darwin_amd64.tar.gz"
      sha256 "3c5c16ed981b0911703fda428ba8331c2654adad710cac94de753ab51d10525b"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.3/mycel_0.4.3_linux_arm64.tar.gz"
      sha256 "8d4d86dc37fb1acd1f19dd55a3ca0b0195bb398b47b81e2f565bd76945795a71"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.3/mycel_0.4.3_linux_amd64.tar.gz"
      sha256 "338a264d360c79f9d20342f600f5c2f14cfca72c99e195ca730375794d60d1e0"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
