class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.10/mycel_0.3.10_darwin_arm64.tar.gz"
      sha256 "cc9468a732deb7fe4e53d4286c24f7a94e40fe6b67540852bf52ba306c1c4383"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.10/mycel_0.3.10_darwin_amd64.tar.gz"
      sha256 "44d93cfa2625902425ead4f9961f88d512a280030bcb2604bc25130f43ab17c6"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.10/mycel_0.3.10_linux_arm64.tar.gz"
      sha256 "2989196e057e3fdf70e4c607ca652fde1c729d690100da64415f06cd03c59b93"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.10/mycel_0.3.10_linux_amd64.tar.gz"
      sha256 "b195dd74b754f0aaaddebd5551a36e2fa70245a5a328e66ade8e81b1b1ac9537"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
