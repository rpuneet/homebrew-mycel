class Mycel < Formula
  desc "CLI-first AI agent orchestration system"
  homepage "https://github.com/rpuneet/mycel"
  version "0.3.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.7/mycel_0.3.7_darwin_arm64.tar.gz"
      sha256 "8f4b9a99d4093bbaecff94e4f483bddad5b969fc5a4fc051ef71e9c832125bdd"
    else
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.7/mycel_0.3.7_darwin_amd64.tar.gz"
      sha256 "82813c747b29d0e540dd967889ffbaf5cb5bea8e130aca997b89def07c5d6661"
    end

    def install
      bin.install "mycel"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.7/mycel_0.3.7_linux_arm64.tar.gz"
      sha256 "f783def91ad03b3b5b72f11a1b084d5bd967f99701c85e86c9a267974c7c0c88"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/rpuneet/mycel/releases/download/v0.3.7/mycel_0.3.7_linux_amd64.tar.gz"
      sha256 "4716576ab9484cfc39d9532f90bf8fb1bcf27afd4bbd505685e7d50cc6ee5e80"
    end

    def install
      bin.install "mycel"
    end
  end

  test do
    system "#{bin}/mycel", "version"
  end
end
