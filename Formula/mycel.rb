class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.5/mycel_0.2.5_darwin_arm64.tar.gz"
      sha256 "7d40dbd93bf84e0ec873605bc249cba08c2a83f3af5340a98b038a5df525b61f"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.5/mycel_0.2.5_darwin_amd64.tar.gz"
      sha256 "8f0e7bf17b912db57b1699b55b29d945e6de7923ace378c31158eab927ff0466"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.5/mycel_0.2.5_linux_arm64.tar.gz"
      sha256 "5aa67242a63a5f3256391efc8237cc969446b45ba93218ecaf2f78712f658e40"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.2.5/mycel_0.2.5_linux_amd64.tar.gz"
      sha256 "6df849e8113627c9de5702cc6edc03578d5f19cd65fc20ae44597e577e582fa7"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
