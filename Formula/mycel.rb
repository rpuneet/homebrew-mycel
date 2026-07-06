class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.13/mycel_0.3.13_darwin_arm64.tar.gz"
      sha256 "0953b2694c8214ee34e4511fcf0a46aab77fbb1eaa4b524819d627520e7911f4"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.13/mycel_0.3.13_darwin_amd64.tar.gz"
      sha256 "48663de279da548a25686ecd5c2b4e4d76364b3bb52bb78a48b0c1ef40f5f4f1"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.13/mycel_0.3.13_linux_arm64.tar.gz"
      sha256 "d018779c30b5c7f3f69a22b1315bc56ba9d42e263d012607d3914560f4ca1e8d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.13/mycel_0.3.13_linux_amd64.tar.gz"
      sha256 "169fa35b27e925b52d96d44b840abd4e96892ca545e2682886b9a1bd51ec0c32"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
