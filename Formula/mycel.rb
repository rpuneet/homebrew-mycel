class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.11/mycel_0.3.11_darwin_arm64.tar.gz"
      sha256 "1de11351287fe2c39ddbc5463a4ac6b473b7730cec35e8c8d3bc252cc6663465"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.11/mycel_0.3.11_darwin_amd64.tar.gz"
      sha256 "2902f62f5bb58d809a01735cc437de59b2d4702dffb7077804e2e5afdc396c59"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.11/mycel_0.3.11_linux_arm64.tar.gz"
      sha256 "df57612662cc7b0817ecb3be41de36f7c7f2d0b9263383e5898d99e879c520c7"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.11/mycel_0.3.11_linux_amd64.tar.gz"
      sha256 "30e036df305f64306d8471c0ee685a17cb89c97e4edc2a68d99d19c3a1c24ffb"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
