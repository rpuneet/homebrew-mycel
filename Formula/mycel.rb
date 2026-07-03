class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.4/mycel_0.3.4_darwin_arm64.tar.gz"
      sha256 "3ced66d57ace8521d5b4f53608e9b9f2fb1a1b855161ff9684d651043f6e7b3a"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.4/mycel_0.3.4_darwin_amd64.tar.gz"
      sha256 "ec8a1fddfb36b82ea5efd68db771845ed3e9f5ae207b32c379f05e623182493c"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.4/mycel_0.3.4_linux_arm64.tar.gz"
      sha256 "2c6a089820995149f232d21a5b88436b2f235e24cb6ea0333ac75fdc54428f1d"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.4/mycel_0.3.4_linux_amd64.tar.gz"
      sha256 "1d4ec8ad217598381e54d8952e9a2145b520924d3b7c4990f036ffeda81687ab"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
