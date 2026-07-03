class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.5/mycel_0.3.5_darwin_arm64.tar.gz"
      sha256 "31b62d3d6b93aa70076fc7497c16698df9a7e8067d0fa9ebebc708363d672ee2"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.5/mycel_0.3.5_darwin_amd64.tar.gz"
      sha256 "a6e08112fe4819b13e7b0d7559dc49ac18f5a8ccea03d317ad04c38829897635"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.5/mycel_0.3.5_linux_arm64.tar.gz"
      sha256 "f6ec2013364461ae3925fafb4686ed0223a059135d5616ef62bebf8c710d7ab9"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.5/mycel_0.3.5_linux_amd64.tar.gz"
      sha256 "5ce038dd1b81167ff412fb9b19340c0f85d81b2f0315c400b5e227956f82f997"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
