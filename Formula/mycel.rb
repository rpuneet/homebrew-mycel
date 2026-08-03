class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.5/mycel_0.4.5_darwin_arm64.tar.gz"
      sha256 "2527bc8025a8671ab2e4d6cd7deb86c7a2585ce6be2dfd7023a395f6eb654a93"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.5/mycel_0.4.5_darwin_amd64.tar.gz"
      sha256 "6ce8b077f982c4d960cb7e30b86a0e839d4bb1d6b85c0fc9a547fbb02dc49a7b"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.5/mycel_0.4.5_linux_arm64.tar.gz"
      sha256 "66651ad46fea647bf97f86491c46b11dc8617afc7afbcd6aebd78a850f3ede18"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.4.5/mycel_0.4.5_linux_amd64.tar.gz"
      sha256 "32ee3063a137a3b12e4d191223d6269f10a12eac9f8197f6ca5a2c7ac5ba19d5"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
