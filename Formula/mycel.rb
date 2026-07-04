class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.9/mycel_0.3.9_darwin_arm64.tar.gz"
      sha256 "95a3ebe168aa3eafc70a306ea7f5fc5baabb8014485f2b0757b195af5dcc8f00"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.9/mycel_0.3.9_darwin_amd64.tar.gz"
      sha256 "fb377427ba40c3756c3bedea0abc44c2966f3a767f1715eea5330fbd1cb48222"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.9/mycel_0.3.9_linux_arm64.tar.gz"
      sha256 "bec72960d1f083bf1c618a0833b88d15f36195583147cd35d583cc29c0d4debe"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.9/mycel_0.3.9_linux_amd64.tar.gz"
      sha256 "1bce2b85fef73dd7a749779f57726dffc5fde5184f05dbfc7257bc67bff3596c"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
